import os
import sys
import time
import subprocess

from PySide6.QtCore import Qt, QPoint, QRect, QSize

# from PySide6.QtGui import QAction, QImage, QKeySequence, QPixmap
from PySide6.QtWidgets import (
    QApplication,
    QLabel,
    QMainWindow,
    QVBoxLayout,
    QWidget,
    QRubberBand,
)


class Window(QMainWindow):
    def __init__(self, sizes):
        super().__init__()
        # Title and dimensions
        self.setWindowTitle("Select region")
        # self.setGeometry(0, 0, 800, 500)
        self.sizes = sizes

        self.setWindowOpacity(0.6)

        self.rubberBand = QRubberBand(QRubberBand.Rectangle, self)

        # Create a label for the display camera
        # self.label = QLabel(self)
        # self.label.setFixedSize(640, 480)

        # Main layout
        # layout = QVBoxLayout()
        # layout.addWidget(self.label)

        # Central widget
        widget = QWidget(self)
        # widget.setLayout(layout)
        self.setCentralWidget(widget)

    def mousePressEvent(self, event):
        if event.button() == Qt.LeftButton:
            self.origin = event.pos()
            self.rubberBand.setGeometry(QRect(self.origin, QSize()))
            self.rubberBand.show()

    def mouseMoveEvent(self, event):
        if not self.origin.isNull():
            self.rubberBand.setGeometry(QRect(self.origin, event.pos()).normalized())

    def mouseReleaseEvent(self, event):
        if event.button() == Qt.LeftButton:
            self.rubberBand.hide()
            print(self.rubberBand)
            print(self.rubberBand.shape())
            print(self.rubberBand.pos())
            print(self.rubberBand.size())
            print(self.rubberBand.width())
            print(self.rubberBand.height())
            self.sizes[0] = self.rubberBand.pos().y()
            self.sizes[1] = self.rubberBand.pos().x()
            self.sizes[2] = self.rubberBand.width()
            self.sizes[3] = self.rubberBand.height()

            self.close()


if __name__ == "__main__":
    app = QApplication()
    sizes = [0, 0, 0, 0]
    w = Window(sizes)
    # w.show()
    # w.showMaximized()
    w.showFullScreen()
    app.exec()

    print(sizes)

    cmd = [
        "vlc",
        "--screen-fps=10",
        f"--screen-top={sizes[0]}",
        f"--screen-left={sizes[1]}",
        f"--screen-width={sizes[2]}",
        f"--screen-height={sizes[3]}",
        "screen://",
    ]
    print(cmd)
    subprocess.run(cmd)

    sys.exit(0)
