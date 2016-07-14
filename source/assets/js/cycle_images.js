class Cycler {
  // limit is highest number, not totol; i.e., for 5 screenshots, use 4
  constructor(shotname, linkname, limit) {
    this.index = 0;
    this.shotname = shotname;
    this.linkname = linkname;
    this.limit = limit;
  }

  hide() {
    document.getElementById(this.shotname + this.index).className = 'invisible-screenshot';
    document.getElementById(this.linkname + this.index).className = 'invisible-link';
  }

  show() {
    document.getElementById(this.shotname + this.index).className = 'visible-screenshot';
    document.getElementById(this.linkname + this.index).className = 'visible-link';
  }

  previousImage() {
    this.hide();
    this.index -= 1;
    if (this.index < 0) {
      this.index = this.limit;
    }
    this.show();
  }

  nextImage() {
    this.hide();
    this.index += 1;
    if (this.index > this.limit) {
      this.index = 0;
    }
    this.show();
  }
}
