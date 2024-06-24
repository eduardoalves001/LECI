import * as THREE from 'three';

const KEYS = {
  ArrowUp: 38,
  ArrowDown: 40,
  ArrowLeft: 37,
  ArrowRight: 39
};

class InputController {
  constructor() {
    this.initialize_();
  }
  initialize_() {
    this.current_ = {
      leftButton: false,
      rightButton: false,
      mouseX: 0,
      mouseY: 0
    };
    this.previous_ = null;
    this.keys = {};

    document.addEventListener('mousedown', (e) => this.onMouseDown_(e), false);
    document.addEventListener('mouseup', (e) => this.onMouseUp_(e), false);
    document.addEventListener('mousemove', (e) => this.onMouseMove_(e), false);
    document.addEventListener('keydown', (e) => this.onKeyDown_(e), false);
    document.addEventListener('keyup', (e) => this.onKeyUp_(e), false);
  }

  onMouseDown_(e) {
    switch (e.button) {
      case 0: {
        this.current_.leftButton = true;
        break;
      }
      case 2: {
        this.current_.rightButton = true; 
        break;
      }
    }
  }
  onMouseUp_(e) {
    switch (e.button) {
      case 0: {
        this.current_.leftButton = false;
        break;
      }
      case 2: {
        this.current_.rightButton = false;
        break;
      }
    }
  }

  onMouseMove_(e) {
    this.current_.mouseX = e.pageX - window.innerWidth / 2; 
    this.current_.mouseY = e.pageY - window.innerWidth / 2; 

    if (this.previous_ === null) {
      this.previous_ = { ...this.current_ };
    }
    this.current_.mouseXDelta = this.current_.mouseX - this.previous_.mouseX;
    this.current_.mouseYDelta = this.current_.mouseY - this.previous_.mouseY;
  }
  onKeyDown_(e) {
    this.keys[e.keyCode] = true; 
  }
  onKeyUp_(e) {
    this.keys[e.keyCode] = false;
  }

  update() {
    this.previous_ = { ...this.current_ };
  }
}

class FirstPersonCamera {
  constructor(camera) {
    this.camera_ = camera;
    this.input_ = new InputController();
    this.rotation_ = new THREE.Quaternion();
    this.translation_ = new THREE.Vector3();
    this.phiSpeed_ = 5;
    this.thetaSpeed_ = 8;
    this.phi_ = 0;
    this.theta_ = 0;
  }

  update(timeElapsedS) {
    this.updateRotation_(timeElapsedS);
    this.updateCamera_(timeElapsedS);
    this.updateTranslation_(timeElapsedS);
    this.input_.update(timeElapsedS);
  }
  updateCamera_() {
    this.camera_.quaternion.copy(this.rotation_);
    this.camera_.position.copy(this.translation_);
  }
}

export { InputController, FirstPersonCamera };