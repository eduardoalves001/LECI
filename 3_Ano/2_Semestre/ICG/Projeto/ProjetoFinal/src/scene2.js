import * as THREE from 'three';
import { createCamera } from './camera.js';
import { createAssetInstance } from './assets.js';
import { GLTFLoader } from 'three/addons/loaders/GLTFLoader.js';
import { InputController, FirstPersonCamera } from './firstPersonCamera.js';

let rainEffect = null;
let sakuraEffect = null; 
let snowEffect = null;

export function createScene() {

  const gameWindow = document.getElementById('render-target');
  const scene = new THREE.Scene();
  const camera = createCamera(gameWindow);

  const FPcamera = new THREE.PerspectiveCamera();
  const firstPersonCamera = new FirstPersonCamera(FPcamera);
  FPcamera.position.set(1, 1, 15);

  const renderer = new THREE.WebGLRenderer();
  scene.background = new THREE.Color(0x87ceeb);
  renderer.setSize(gameWindow.offsetWidth, gameWindow.offsetHeight);
  renderer.setClearColor(0x000000, 0);
  renderer.shadowMap.enabled = true;
  renderer.shadowMap.type = THREE.PCFSoftShadowMap;
  gameWindow.appendChild(renderer.domElement);

  const raycaster = new THREE.Raycaster();
  const mouse = new THREE.Vector2();

  

  document.addEventListener('keydown', (event) => {
    firstPersonCamera.input_.onKeyDown_(event);
  });
  document.addEventListener('keyup', (event) => {
      firstPersonCamera.input_.onKeyUp_(event);
  });

  // Valores importantes para o tempo
  let time = 0;

  let activeCamera = camera;
  let activeObject = undefined;
  let hoverObject = undefined;

  let buildings = [];

  const sunMesh = createAssetInstance('sun', 10, 10);
  const moonMesh = createAssetInstance('moon', 10, 10); 


  let starsAdded = false; // Booleano para verificar se as estrelas foram adicionadas

  function toggleCamera() {
    console.log('Toggling camera...');
    activeCamera = activeCamera === camera ? firstPersonCamera.camera_ : camera;
    console.log('Active camera:', activeCamera === camera ? 'Perspective' : 'First Person');
}

  document.addEventListener('keydown', function(event) {
    console.log('Key pressed:', event.key);
    if (event.key === 'f') {
        toggleCamera();
    }
});



  // ---------------------------- ADICIONAR NEVE A CAIR DURANTE A NOITE ------------------------------------------

  function createSnow() {
    // Instanção dos parâmetros de neve
    const snowCount = 5000;
    const snowGeometry = new THREE.BufferGeometry();
    const snowMaterial = new THREE.PointsMaterial({
        color: 0xffffff,
        size: 1,
        transparent: false,
        opacity: 1
    });

    // Criar particulas de neve
    const snowVertices = [];
    for (let i = 0; i < snowCount; i++) {
        const x = Math.random() * 200 - 100;
        const y = Math.random() * 100 + 50; 
        const z = Math.random() * 200 - 100;
        snowVertices.push(x, y, z);
    }
    snowGeometry.setAttribute('position', new THREE.Float32BufferAttribute(snowVertices, 3));
    const snow = new THREE.Points(snowGeometry, snowMaterial);
    snow.userData.ignoreSelection = true;

    // Update à animação da neve
    function animateSnow() {
        const positions = snow.geometry.attributes.position.array;
        for (let i = 1; i < positions.length; i += 3) {
            positions[i] -= 0.1; // Update à posição do y para simular a queda de neve
            if (positions[i] < -50) {
                positions[i] = 100; //Resetar a posição da neve no caso de neve antiga sair do ecrã
            }
        }
        snow.geometry.attributes.position.needsUpdate = true; // Update às posições das particulas
    }
    return { snow, animateSnow };
  }

  const { snow, animateSnow } = createSnow();

function startSnow() {
    if (!snowEffect) {
      const { snow, animateSnow } = createSnow();
      snowEffect = { snow, animateSnow };
      scene.add(snowEffect.snow);
    }
}

function stopSnow() {
    if (snowEffect) {
        // Remover neve da scene
        scene.remove(snowEffect.snow);
        snowEffect = null;
    }
}



  // ---------------------------- ADICIONAR PETALAS DE SAKURA A CAIREM DURANTE O DIA -----------------------------


  function createSakura() {
    // Instanciação das particulas de Sakura
    const sakuraCount = 5000;
    const sakuraGeometry = new THREE.BufferGeometry();
    const sakuraMaterial = new THREE.PointsMaterial({
        color: 0xffc0cb,
        size: 1,
        transparent: false,
        opacity: 1
    });

    // Criação das particulas de Sakura
    const sakuraVertices = [];
    for (let i = 0; i < sakuraCount; i++) {
        const x = Math.random() * 200 - 100; // Posição do X aleatória
        const y = Math.random() * 100 + 50;   // Posição do y inicial, acima da scene
        const z = Math.random() * 200 - 100; // Posição do z dentro da scene
        sakuraVertices.push(x, y, z);
    }
    sakuraGeometry.setAttribute('position', new THREE.Float32BufferAttribute(sakuraVertices, 3));
    const sakura = new THREE.Points(sakuraGeometry, sakuraMaterial);
    sakura.userData.ignoreSelection = true;

    // Update à animação da Sakura
    function animateSakura() {
        const positions = sakura.geometry.attributes.position.array;
        for (let i = 1; i < positions.length; i += 3) {
            positions[i] -= 0.1; // Update à posição do y para simular a queda de Sakura
            if (positions[i] < -50) {
                positions[i] = 100; //Resetar a posição das pétalas de sakura no caso de neve antiga sair do ecrã
            }
        }
        sakura.geometry.attributes.position.needsUpdate = true;
    }
    return { sakura, animateSakura };
  }

  const { sakura, animateSakura } = createSakura();

function startSakura() {
    if (!sakuraEffect) {
      const { sakura, animateSakura } = createSakura(); 
      sakuraEffect = { sakura, animateSakura };
      scene.add(sakuraEffect.sakura);
    }
}

function stopSakura() {
    if (sakuraEffect) {
        scene.remove(sakuraEffect.sakura);
        sakuraEffect = null;
    }
}


  // ----------------------------- ADICIONAR CHUVA DURANTE O DIA ----------------------------------------

  function createRain() {
    const rainCount = 9000;
    const rainGeometry = new THREE.BufferGeometry();
    const rainMaterial = new THREE.PointsMaterial({
        color: 0x7777ff,
        size: 0.5,
        transparent: true,
        opacity: 1
    });

    const rainVertices = [];
    for (let i = 0; i < rainCount; i++) {
        const x = Math.random() * 200 - 100; 
        const y = Math.random() * 100 + 50;  
        const z = Math.random() * 200 - 100; 
        rainVertices.push(x, y, z);
    }
    rainGeometry.setAttribute('position', new THREE.Float32BufferAttribute(rainVertices, 3));
    const rain = new THREE.Points(rainGeometry, rainMaterial);
    rain.userData.ignoreSelection = true;

    function animateRain() {
        const positions = rain.geometry.attributes.position.array;
        for (let i = 1; i < positions.length; i += 3) {
            positions[i] -= 0.1; 
            if (positions[i] < -50) {
                positions[i] = 100;
            }
        }
        rain.geometry.attributes.position.needsUpdate = true;
    }
    return { rain, animateRain };
  }

  const { rain, animateRain } = createRain();

function startRain() {
    if (!rainEffect) {
      const { rain, animateRain } = createRain();
      rainEffect = { rain, animateRain };
      scene.add(rainEffect.rain);
    }
}

function stopRain() {
    if (rainEffect) {
        scene.remove(rainEffect.rain);
        rainEffect = null;
    }
}

// -------------------------------------- ADICIONAR ESTRELAS AO CÉU NOTURNO ---------------------------------

function addStarsToSky() {
    if (!starsAdded && sunMesh.position.y < 0) {
        const starCount = 10000;
        const starGeometry = new THREE.BufferGeometry();
        const starMaterial = new THREE.PointsMaterial({
            color: 0xffffff,
            size: 0.1,
        });
        const starVertices = [];
        for (let i = 0; i < starCount; i++) {
            const x = THREE.MathUtils.randFloatSpread(2000);
            const y = THREE.MathUtils.randFloatSpread(2000);
            const z = THREE.MathUtils.randFloatSpread(2000);
            starVertices.push(x, y, z);
        }
        starGeometry.setAttribute('position', new THREE.Float32BufferAttribute(starVertices, 3));
        const stars = new THREE.Points(starGeometry, starMaterial);
        stars.userData.ignoreSelection = true;
        scene.add(stars);
        starsAdded = true;
    }
}

  function initialize(city) {
    scene.clear();
    buildings = [];
  

    for (let x = 0; x < city.size; x++) {
      const column = [];
      for (let y = 0; y < city.size; y++) {
        const mesh = createAssetInstance(city.tiles[x][y].terrainId, x, y);
        scene.add(mesh);
        column.push(mesh);
      }
      buildings.push([...Array(city.size)]);
    }

   
    loadHouseModel1();
    loadHouseModel2();
    loadHouseModel3();
    loadHouseModel4();
    loadHouseModel5();
    loadHouseModel6();
    loadHouseModel7();
    loadHouseModel8();
    loadHouseModel9();

    loadLamp();
    loadLamp1();
    loadLamp2();
    loadLamp3();

    loadWalls();
    
    load3DPagoda();
    load3DTree1();
    load3DTree2();
    load3DTree3();
    load3DTree4();
    load3DTree5();
    load3DTree6();
    load3DTree7();
    load3DTree8();
    load3DTree9();
    load3DTorii1();
    load3DTorii2();
    load3DTorii3();

    loadpicnic();
    loadpicnic1();

    load3DBench();

    load3DVendingMachine();
    load3DArcade();

    load3DLantern();
    load3DLantern1();

    loadStatue();
    loadStatue1();

    loadfountain();

    loadpond();
    loadbridge();
    loadSword();


    scene.add(sunMesh);
    scene.add(moonMesh);

    setupLights();
  }

  function updateBackground() {
    const isNight = sunMesh.position.y <= 0;
    
    if (isNight) {
        addStarsToSky();
        scene.background.setHex(0x000022);
        if (sunMesh.position.x >= 0) {
            stopSakura();
            startRain();
            stopSnow();
        } else{
            startSnow();
            stopRain();
            stopSakura();
        }
    }else{
        scene.background.setHex(0x87ceeb);
        if(sunMesh.position.x > 0){
          stopRain();
          stopSakura();
          stopSnow();
        }else{
            startSakura();
            stopRain();
            stopSnow();
        }
    }
  }
updateBackground();

//------------------------------ Try stuff out ---------------------------------------------


function getMainCharacter() {
  return new Promise((resolve, reject) => {
      let modelUrl;
      const gtlloaderHouse = new GLTFLoader();

      let characterName = localStorage.getItem('selectedCharacter');

      switch (characterName) {
        case 'Percival':
            modelUrl = './modelos/percival.glb';
            break;
        case 'Morgana':
            modelUrl = './modelos/mc1.glb';
            break;
        case 'Arthur':
              modelUrl = './modelos/arthur.glb';
              break;
        case 'Merlin':
              modelUrl = './modelos/merlin.glb';
              break;
        default:
              modelUrl = './modelos/percival.glb';
              break;
    }

      gtlloaderHouse.load(
          modelUrl,
          function (gltf) {

              const mainCharacter = gltf.scene;

              if(characterName === 'Percival'){
                mainCharacter.scale.set(0.07, 0.07, 0.07);
              }else if(characterName === 'Arthur'){
                mainCharacter.scale.set(0.5, 0.5, 0.5);
              }else if(characterName === 'Merlin'){
                mainCharacter.scale.set(0.3, 0.3, 0.3);
              }else if(characterName === 'Morgana'){
                mainCharacter.scale.set(0.5, 0.5, 0.5);
              }else{
                mainCharacter.scale.set(0.07, 0.07, 0.07);
              }
                
  

              mainCharacter.position.set(5, 0, 5);
              scene.add(mainCharacter);
              console.log(characterName); // Utilizing characterName
              resolve(mainCharacter);
          },
          function (xhr) {
              console.log((xhr.loaded / xhr.total) * 100 + '% loaded');
          },
          function (error) {
              console.log('An error happened');
              reject(error);
          }
      );
  });
}

getMainCharacter().then(mainCharacter => {
  const speed = 0.2; 

  let oeste = false;
  let este = true;
  let norte = false;
  let sul = false;

  const minX = 0;
  const maxX = 28;
  const minZ = 0;
  const maxZ = 28;

  document.addEventListener('keydown', (event) => {
      let movementDirection = new THREE.Vector3(); 

      switch (event.key) {
          case 's':
              if (mainCharacter.position.x - speed > minX) {
                  mainCharacter.position.x -= speed;
                  movementDirection.x = -1; 
                  sul = true;
                  norte = false;
                  oeste = false;
                  este = false;
              }
              break;
          case 'a':
              if (mainCharacter.position.z - speed > minZ) {
                  mainCharacter.position.z -= speed;
                  movementDirection.z = -1; 
                  sul = false;
                  norte = false;
                  oeste = true;
                  este = false;
              }
              break;
          case 'w':
              if (mainCharacter.position.x + speed < maxX) {
                  mainCharacter.position.x += speed;
                  movementDirection.x = 1; 
                  sul = false;
                  norte = true;
                  oeste = false;
                  este = false;
              }
              break;
          case 'd':
              if (mainCharacter.position.z + speed < maxZ) {
                  mainCharacter.position.z += speed;
                  movementDirection.z = 1; 
                  sul = false;
                  norte = false;
                  oeste = false;
                  este = true;
              }
              break;
      }
      mainCharacter.lookAt(mainCharacter.position.clone().add(movementDirection));
      firstPersonCamera.camera_.position.copy(mainCharacter.position);
      firstPersonCamera.camera_.position.setY(1);
      if(norte){
        firstPersonCamera.camera_.rotation.set(0, -Math.PI/2, 0);
      }else if(este){
        firstPersonCamera.camera_.rotation.set(0, Math.PI, 0);
      }else if(oeste){
        firstPersonCamera.camera_.rotation.set(0, 0, 0);
      }else if(sul){
        firstPersonCamera.camera_.rotation.set(0, Math.PI/2, 0);
      }

  });
}).catch(error => {
  console.error('Failed to load main character:', error);
});


function loadpond() {
  // Verificação, se a posição já está ocupada antes de carregar o modelo
       const houseUrl = './modelos/pond.glb';
       const gtlloaderHouse = new GLTFLoader();
 
       gtlloaderHouse.load(
           houseUrl,
           function (gltf) {
               const pond = gltf.scene;
               pond.scale.set(0.03, 0.003, 0.03);
               pond.position.set(6,0,22);
               scene.add(pond);
           },
           function (xhr) {
               console.log((xhr.loaded / xhr.total) * 100 + '% loaded');
           },
           function (error) {
               console.log('An error happened');
           }
       );
 }

 function loadbridge() {
  // Verificação, se a posição já está ocupada antes de carregar o modelo
       const houseUrl = './modelos/bridge.glb';
       const gtlloaderHouse = new GLTFLoader();
 
       gtlloaderHouse.load(
           houseUrl,
           function (gltf) {
               const bridge = gltf.scene;
               bridge.scale.set(1.3, 1.3, 1.3);
               bridge.position.set(6,2.3,22);
               scene.add(bridge);
           },
           function (xhr) {
               console.log((xhr.loaded / xhr.total) * 100 + '% loaded');
           },
           function (error) {
               console.log('An error happened');
           }
       );
 }


function loadHouseModel1() {
 // Verificação, se a posição já está ocupada antes de carregar o modelo
      const houseUrl = './modelos/house.glb';
      const gtlloaderHouse = new GLTFLoader();

      gtlloaderHouse.load(
          houseUrl,
          function (gltf) {
              const houseModel = gltf.scene;
              houseModel.scale.set(2, 2, 2);
              houseModel.position.set(20,0,1.5);
              scene.add(houseModel);
          },
          function (xhr) {
              console.log((xhr.loaded / xhr.total) * 100 + '% loaded');
          },
          function (error) {
              console.log('An error happened');
          }
      );
}


function loadHouseModel2() {
  // Verificação, se a posição já está ocupada antes de carregar o modelo
       const houseUrl = './modelos/house.glb';
       const gtlloaderHouse = new GLTFLoader();
 
       gtlloaderHouse.load(
           houseUrl,
           function (gltf) {
               const houseModel = gltf.scene;
               houseModel.scale.set(2, 2, 2);
               houseModel.position.set(18,0,1.5);
               scene.add(houseModel);
           },
           function (xhr) {
               console.log((xhr.loaded / xhr.total) * 100 + '% loaded');
           },
           function (error) {
               console.log('An error happened');
           }
       );
 }
 function loadHouseModel3() {
  // Verificação, se a posição já está ocupada antes de carregar o modelo
       const houseUrl = './modelos/house.glb';
       const gtlloaderHouse = new GLTFLoader();
 
       gtlloaderHouse.load(
           houseUrl,
           function (gltf) {
               const houseModel = gltf.scene;
               houseModel.scale.set(2, 2, 2);
               houseModel.position.set(16,0,1.5);
               scene.add(houseModel);
           },
           function (xhr) {
               console.log((xhr.loaded / xhr.total) * 100 + '% loaded');
           },
           function (error) {
               console.log('An error happened');
           }
       );
 }
 function loadHouseModel4() {
  // Verificação, se a posição já está ocupada antes de carregar o modelo
       const houseUrl = './modelos/house.glb';
       const gtlloaderHouse = new GLTFLoader();
 
       gtlloaderHouse.load(
           houseUrl,
           function (gltf) {
               const houseModel = gltf.scene;
               houseModel.scale.set(2, 2, 2);
               houseModel.position.set(14,0,1.5);
               scene.add(houseModel);
           },
           function (xhr) {
               console.log((xhr.loaded / xhr.total) * 100 + '% loaded');
           },
           function (error) {
               console.log('An error happened');
           }
       );
 }
 function loadHouseModel5() {
  // Verificação, se a posição já está ocupada antes de carregar o modelo
       const houseUrl = './modelos/house.glb';
       const gtlloaderHouse = new GLTFLoader();
 
       gtlloaderHouse.load(
           houseUrl,
           function (gltf) {
               const houseModel = gltf.scene;
               houseModel.scale.set(2, 2, 2);
               houseModel.position.set(12,0,1.5);
               scene.add(houseModel);
           },
           function (xhr) {
               console.log((xhr.loaded / xhr.total) * 100 + '% loaded');
           },
           function (error) {
               console.log('An error happened');
           }
       );
 }

 function loadHouseModel6() {
  // Verificação, se a posição já está ocupada antes de carregar o modelo
       const houseUrl = './modelos/house.glb';
       const gtlloaderHouse = new GLTFLoader();
 
       gtlloaderHouse.load(
           houseUrl,
           function (gltf) {
               const houseModel = gltf.scene;
               houseModel.scale.set(2, 2, 2);
               houseModel.position.set(10,0,1.5);
               scene.add(houseModel);
           },
           function (xhr) {
               console.log((xhr.loaded / xhr.total) * 100 + '% loaded');
           },
           function (error) {
               console.log('An error happened');
           }
       );
 }

 function loadHouseModel7() {
  // Verificação, se a posição já está ocupada antes de carregar o modelo
       const houseUrl = './modelos/house.glb';
       const gtlloaderHouse = new GLTFLoader();
 
       gtlloaderHouse.load(
           houseUrl,
           function (gltf) {
               const houseModel = gltf.scene;
               houseModel.scale.set(2, 2, 2);
               houseModel.position.set(8,0,1.5);
               scene.add(houseModel);
           },
           function (xhr) {
               console.log((xhr.loaded / xhr.total) * 100 + '% loaded');
           },
           function (error) {
               console.log('An error happened');
           }
       );
 }

 function loadHouseModel8() {
  // Verificação, se a posição já está ocupada antes de carregar o modelo
       const houseUrl = './modelos/house.glb';
       const gtlloaderHouse = new GLTFLoader();
 
       gtlloaderHouse.load(
           houseUrl,
           function (gltf) {
               const houseModel = gltf.scene;
               houseModel.scale.set(2, 2, 2);
               houseModel.position.set(6,0,1.5);
               scene.add(houseModel);
           },
           function (xhr) {
               console.log((xhr.loaded / xhr.total) * 100 + '% loaded');
           },
           function (error) {
               console.log('An error happened');
           }
       );
 }

 function loadHouseModel9() {
  // Verificação, se a posição já está ocupada antes de carregar o modelo
       const houseUrl = './modelos/house.glb';
       const gtlloaderHouse = new GLTFLoader();
 
       gtlloaderHouse.load(
           houseUrl,
           function (gltf) {
               const houseModel = gltf.scene;
               houseModel.scale.set(2, 2, 2);
               houseModel.position.set(4,0,1.5);
               scene.add(houseModel);
           },
           function (xhr) {
               console.log((xhr.loaded / xhr.total) * 100 + '% loaded');
           },
           function (error) {
               console.log('An error happened');
           }
       );
 }


 // Load Walls -----------------------------------------------------------------

 function loadWalls() {
  const wallPath = './modelos/wall.glb'; // Path to the wall model

  const numWalls = 5; // Number of walls to summon

  // Loop to summon each wall
  for (let i = 0; i < numWalls; i++) {
      const position = new THREE.Vector3(29, 0, 2.6 + i * 5.95); // Adjust the position as needed
      const rotation = new THREE.Euler(0, Math.PI / 2, 0); // Adjust the rotation as needed
      const wallScale = 4; // Scale factor for the walls

      loadWall(wallPath, position, rotation, wallScale);
  }
}

// Function to load a single wall
function loadWall(wallPath, position, rotation, scale) {
  const gtlloaderWall = new GLTFLoader();

  gtlloaderWall.load(
      wallPath,
      function (gltf) {
          const wall = gltf.scene;
          wall.scale.set(scale, scale, scale);
          wall.position.copy(position);
          wall.rotation.copy(rotation);
          scene.add(wall);
      },
      function (xhr) {
          console.log((xhr.loaded / xhr.total) * 100 + '% loaded');
      },
      function (error) {
          console.log('An error happened');
      }
  );
}


function loadLamp() {
  const gtlloaderTree = new GLTFLoader();

  gtlloaderTree.load(
  
      './modelos/lamp.glb',

      function (gltf) {
          const lamp = gltf.scene;
          lamp.scale.set(0.5, 0.5, 0.5);
          lamp.position.set(1, 1.1, 1);
          lamp.rotation.y = -Math.PI/2;
          scene.add(gltf.scene);
      },
      function (xhr) {
          console.log((xhr.loaded / xhr.total * 100) + '% loaded');
      },
      function (error) {
          console.log('An error happened');
      }
  );
}

function loadLamp1() {
  const gtlloaderTree = new GLTFLoader();

  gtlloaderTree.load(
  
      './modelos/lamp.glb',

      function (gltf) {
          const lamp = gltf.scene;
          lamp.scale.set(0.5, 0.5, 0.5);
          lamp.position.set(25, 1.1, 1);
          lamp.rotation.y = -Math.PI/2;
          scene.add(gltf.scene);
      },
      function (xhr) {
          console.log((xhr.loaded / xhr.total * 100) + '% loaded');
      },
      function (error) {
          console.log('An error happened');
      }
  );
}

function loadLamp2() {
  const gtlloaderTree = new GLTFLoader();

  gtlloaderTree.load(
  
      './modelos/lamp.glb',

      function (gltf) {
          const lamp = gltf.scene;
          lamp.scale.set(0.5, 0.5, 0.5);
          lamp.position.set(1, 1.1, 28);
          lamp.rotation.y = -Math.PI/2;
          scene.add(gltf.scene);
      },
      function (xhr) {
          console.log((xhr.loaded / xhr.total * 100) + '% loaded');
      },
      function (error) {
          console.log('An error happened');
      }
  );
}

function loadLamp3() {
  const gtlloaderTree = new GLTFLoader();

  gtlloaderTree.load(
  
      './modelos/lamp.glb',

      function (gltf) {
          const lamp = gltf.scene;
          lamp.scale.set(0.5, 0.5, 0.5);
          lamp.position.set(25, 1.1, 28);
          lamp.rotation.y = -Math.PI/2;
          scene.add(gltf.scene);
      },
      function (xhr) {
          console.log((xhr.loaded / xhr.total * 100) + '% loaded');
      },
      function (error) {
          console.log('An error happened');
      }
  );
}


function loadStatue() {
  const gtlloaderTree = new GLTFLoader();

  gtlloaderTree.load(
  
      './modelos/statue.glb',

      function (gltf) {
          const statue = gltf.scene;
          statue.scale.set(1, 1, 1);
          statue.position.set(22, 0, 6);
          statue.rotation.y = -Math.PI/2;
          scene.add(gltf.scene);
      },
      function (xhr) {
          console.log((xhr.loaded / xhr.total * 100) + '% loaded');
      },
      function (error) {
          console.log('An error happened');
      }
  );
}

function loadStatue1() {
  const gtlloaderTree = new GLTFLoader();

  gtlloaderTree.load(
  
      './modelos/statue.glb',

      function (gltf) {
          const statue = gltf.scene;
          statue.scale.set(1, 1, 1);
          statue.position.set(22, 0, 24);
          statue.rotation.y = -Math.PI/2;
          scene.add(gltf.scene);
      },
      function (xhr) {
          console.log((xhr.loaded / xhr.total * 100) + '% loaded');
      },
      function (error) {
          console.log('An error happened');
      }
  );
}



// LOAD ARVORES ----------------------------------------------------------------------

function load3DLantern() {
  const gtlloaderTree = new GLTFLoader();

  gtlloaderTree.load(
  
      './modelos/lantern.glb',

      function (gltf) {
          const lantern = gltf.scene;
          lantern.scale.set(2, 2, 2);
          lantern.position.set(22, 1, 20);
          scene.add(gltf.scene);
      },
      function (xhr) {
          console.log((xhr.loaded / xhr.total * 100) + '% loaded');
      },
      function (error) {
          console.log('An error happened');
      }
  );
}

function load3DLantern1() {
  const gtlloaderTree = new GLTFLoader();

  gtlloaderTree.load(
  
      './modelos/lantern.glb',

      function (gltf) {
          const lantern = gltf.scene;
          lantern.scale.set(2, 2, 2);
          lantern.position.set(22, 1, 10);
          scene.add(gltf.scene);
      },
      function (xhr) {
          console.log((xhr.loaded / xhr.total * 100) + '% loaded');
      },
      function (error) {
          console.log('An error happened');
      }
  );
}

function load3DTree1() {
  const gtlloaderTree = new GLTFLoader();

  gtlloaderTree.load(
  
      './modelos/tree.glb',

      function (gltf) {
          const tree = gltf.scene;
          tree.scale.set(0.5, 0.5, 0.5);
          tree.position.set(27, 0, 2);
          scene.add(gltf.scene);
      },
      function (xhr) {
          console.log((xhr.loaded / xhr.total * 100) + '% loaded');
      },
      function (error) {
          console.log('An error happened');
      }
  );
}

function load3DTree2() {
  const gtlloaderTree = new GLTFLoader();

  gtlloaderTree.load(
  
      './modelos/tree.glb',

      function (gltf) {
          const tree = gltf.scene;
          tree.scale.set(0.5, 0.5, 0.5);
          tree.position.set(27, 0, 5);
          scene.add(gltf.scene);
      },
      function (xhr) {
          console.log((xhr.loaded / xhr.total * 100) + '% loaded');
      },
      function (error) {
          console.log('An error happened');
      }
  );
}

function load3DTree9() {
  const gtlloaderTree = new GLTFLoader();

  gtlloaderTree.load(
  
      './modelos/tree.glb',

      function (gltf) {
          const tree = gltf.scene;
          tree.scale.set(0.5, 0.5, 0.5);
          tree.position.set(27, 0, 14);
          scene.add(gltf.scene);
      },
      function (xhr) {
          console.log((xhr.loaded / xhr.total * 100) + '% loaded');
      },
      function (error) {
          console.log('An error happened');
      }
  );
}

function load3DTree3() {
  const gtlloaderTree = new GLTFLoader();

  gtlloaderTree.load(
  
      './modelos/tree.glb',

      function (gltf) {
          const tree = gltf.scene;
          tree.scale.set(0.5, 0.5, 0.5);
          tree.position.set(27, 0, 8);
          scene.add(gltf.scene);
      },
      function (xhr) {
          console.log((xhr.loaded / xhr.total * 100) + '% loaded');
      },
      function (error) {
          console.log('An error happened');
      }
  );
}

function load3DTree4() {
  const gtlloaderTree = new GLTFLoader();
  gtlloaderTree.load(
      './modelos/tree.glb',
      function (gltf) {
          const tree = gltf.scene;
          tree.scale.set(0.5, 0.5, 0.5);
          tree.position.set(27, 0, 11);
          scene.add(gltf.scene);
      },
      function (xhr) {
          console.log((xhr.loaded / xhr.total * 100) + '% loaded');
      },
      function (error) {
          console.log('An error happened');
      }
  );
}

function load3DTree5() {
  const gtlloaderTree = new GLTFLoader();
  gtlloaderTree.load(
      './modelos/tree.glb',
      function (gltf) {
          const tree = gltf.scene;
          tree.scale.set(0.5, 0.5, 0.5);
          tree.position.set(27, 0, 27);
          scene.add(gltf.scene);
      },
      function (xhr) {
          console.log((xhr.loaded / xhr.total * 100) + '% loaded');
      },
      function (error) {
          console.log('An error happened');
      }
  );
}

function load3DTree6() {
  const gtlloaderTree = new GLTFLoader();
  gtlloaderTree.load(
      './modelos/tree.glb',
      function (gltf) {
          const tree = gltf.scene;
          tree.scale.set(0.5, 0.5, 0.5);
          tree.position.set(27, 0, 24);
          scene.add(gltf.scene);
      },
      function (xhr) {
          console.log((xhr.loaded / xhr.total * 100) + '% loaded');
      },
      function (error) {
          console.log('An error happened');
      }
  );
}

function load3DTree7() {
  const gtlloaderTree = new GLTFLoader();
  gtlloaderTree.load(
      './modelos/tree.glb',
      function (gltf) {
          const tree = gltf.scene;
          tree.scale.set(0.5, 0.5, 0.5);
          tree.position.set(27, 0, 21);
          scene.add(gltf.scene);
      },
      function (xhr) {
          console.log((xhr.loaded / xhr.total * 100) + '% loaded');
      },
      function (error) {
          console.log('An error happened');
      }
  );
}

function load3DTree8() {
  const gtlloaderTree = new GLTFLoader();
  gtlloaderTree.load(
      './modelos/tree.glb',
      function (gltf) {
          const tree = gltf.scene;
          tree.scale.set(0.5, 0.5, 0.5);
          tree.position.set(27, 0, 18);
          scene.add(gltf.scene);
      },
      function (xhr) {
          console.log((xhr.loaded / xhr.total * 100) + '% loaded');
      },
      function (error) {
          console.log('An error happened');
      }
  );
}

// LOAD TORIIs ----------------------------------------------------------------


function load3DTorii1(){
  const gtlloaderTorii = new GLTFLoader();

  gtlloaderTorii.load(
    
    './modelos/torii.glb',

    function ( gltf ) {
      const torii = gltf.scene;
      torii.scale.set(2.5, 2.5, 2.5);
      torii.position.set(16,0,15);
      torii.rotateY(Math.PI / 2);
      scene.add( gltf.scene );

    },
    function ( xhr ) {
      console.log( ( xhr.loaded / xhr.total * 100 ) + '% loaded' );
    },
    function ( error ) {
      console.log( 'An error happened' );
    }
  );
}

function load3DTorii2(){
  const gtlloaderTorii = new GLTFLoader();

  gtlloaderTorii.load(

    './modelos/torii.glb',


    function ( gltf ) {
      const torii = gltf.scene;
      torii.scale.set(2.5, 2.5, 2.5);
      torii.position.set(13,0,15);
      torii.rotateY(Math.PI / 2);
      scene.add( gltf.scene );

    },
   
    function ( xhr ) {
      console.log( ( xhr.loaded / xhr.total * 100 ) + '% loaded' );
    },

    function ( error ) {
      console.log( 'An error happened' );
    }
  );
}

function load3DTorii3(){
  const gtlloaderTorii = new GLTFLoader();

  gtlloaderTorii.load(

    './modelos/torii.glb',


    function ( gltf ) {
      const torii = gltf.scene;
      torii.scale.set(2.5, 2.5, 2.5);
      torii.position.set(10,0,15);
      torii.rotateY(Math.PI / 2);
      scene.add( gltf.scene );

    },
 
    function ( xhr ) {
      console.log( ( xhr.loaded / xhr.total * 100 ) + '% loaded' );
    },
   
    function ( error ) {
      console.log( 'An error happened' );
    }
  );
}

function load3DBench(){
  const gtlloaderBench = new GLTFLoader();

  gtlloaderBench.load(
 
    './modelos/bench.glb',

    function ( gltf ) {
      const bench = gltf.scene;
      bench.scale.set(2, 2, 2);
      bench.position.set(13, 0, 28);
      scene.add( gltf.scene );
    },
    function ( xhr ) {
      console.log( ( xhr.loaded / xhr.total * 100 ) + '% loaded' );
    },
    function ( error ) {
      console.log( 'An error happened' );
    }
  );
}

function load3DArcade() {
    const gtlloaderArcade = new GLTFLoader();

    gtlloaderArcade.load(
       
        './modelos/arcadeMachine.glb',

          
        function (gltf) {
          const arcade = gltf.scene;
          arcade.scale.set(0.7, 0.7, 0.7);
          arcade.position.set(15, 0, 28);
          arcade.rotation.y = Math.PI/2;
          scene.add(gltf.scene);
        },
         
        function (xhr) {
          console.log((xhr.loaded / xhr.total * 100) + '% loaded');
        },
        
        function (error) {
          console.log('An error happened');
        }
      );
}

function load3DArcade() {
  const gtlloaderArcade = new GLTFLoader();

  gtlloaderArcade.load(
      
      './modelos/arcadeMachine.glb',

      
      function (gltf) {
        const arcade = gltf.scene;
        arcade.scale.set(0.7, 0.7, 0.7);
        arcade.position.set(15, 0, 28);
        arcade.rotation.y = Math.PI/2;
        scene.add(gltf.scene);
      },
       
      function (xhr) {
        console.log((xhr.loaded / xhr.total * 100) + '% loaded');
      },
     
      function (error) {
        console.log('An error happened');
      }
    );
}

function loadSword() {
  const gtlloaderArcade = new GLTFLoader();

  gtlloaderArcade.load(

      './modelos/sword.glb',

     
      function (gltf) {
        const sword = gltf.scene;
        sword.scale.set(2, 2, 2);
        sword.position.set(19, 0.8, 28);
        sword.rotation.y = Math.PI;
        scene.add(gltf.scene);
      },
       
      function (xhr) {
        console.log((xhr.loaded / xhr.total * 100) + '% loaded');
      },
      
      function (error) {
        console.log('An error happened');
      }
    );
}

function loadfountain() {
  const gtlloaderArcade = new GLTFLoader();

  gtlloaderArcade.load(
    
      './modelos/fountain.glb',


      function (gltf) {
        const fountain = gltf.scene;
        fountain.scale.set(2, 2, 2);
        fountain.position.set(8, 0, 7);
        fountain.rotation.y = Math.PI;
        scene.add(gltf.scene);
      },
      
      function (xhr) {
        console.log((xhr.loaded / xhr.total * 100) + '% loaded');
      },
      
      function (error) {
        console.log('An error happened');
      }
    );
}

function loadpicnic() {
  const gtlloaderArcade = new GLTFLoader();

  gtlloaderArcade.load(
     
      './modelos/picnic.glb',

      
      function (gltf) {
        const picnic = gltf.scene;
        picnic.scale.set(0.7, 0.7, 0.7);
        picnic.position.set(13, 0, 7);
        picnic.rotation.y = Math.PI;
        scene.add(gltf.scene);
      },
      
      function (xhr) {
        console.log((xhr.loaded / xhr.total * 100) + '% loaded');
      },
   
      function (error) {
        console.log('An error happened');
      }
    );
}

function loadpicnic1() {
  const gtlloaderArcade = new GLTFLoader();

  gtlloaderArcade.load(
   
      './modelos/picnic.glb',

       
      function (gltf) {
        const picnic = gltf.scene;
        picnic.scale.set(0.7, 0.7, 0.7);
        picnic.position.set(15, 0, 7);
        picnic.rotation.y = Math.PI;
        scene.add(gltf.scene);
      },
      
      function (xhr) {
        console.log((xhr.loaded / xhr.total * 100) + '% loaded');
      },
     
      function (error) {
        console.log('An error happened');
      }
    );
}

function load3DPagoda() {
    const gtlloaderPagoda = new GLTFLoader();

    gtlloaderPagoda.load(

      './modelos/pagoda.glb',
      function (gltf) {
          const pagoda = gltf.scene;
          pagoda.scale.set(0.25, 0.25, 0.25);
          pagoda.position.set(22, 0, 15);
          scene.add(gltf.scene);

          },
          function (xhr) {
              console.log((xhr.loaded / xhr.total * 100) + '% loaded');
          },
          function (error) {
              console.log('An error happened');
          }
      );
}


function load3DVendingMachine(){

  const gtlloaderVendingMachine = new GLTFLoader();

  gtlloaderVendingMachine.load(

    './modelos/vendingMachine.glb',

    function ( gltf ) {
      const vendingMachine = gltf.scene;
      vendingMachine.scale.set(0.5, 0.5, 0.5);
      vendingMachine.position.set(17, 0, 28);
      vendingMachine.rotation.y = Math.PI;
      scene.add( gltf.scene );
    },

    function ( xhr ) {
      console.log( ( xhr.loaded / xhr.total * 100 ) + '% loaded' );
    },
 
    function ( error ) {
      console.log( 'An error happened' );
    }
  );
}


// ------------------------------- End try stuff out----------------------------

  let lightsCreated = false;
  let light;
  let light1;
  let light2;
  let light3;
  let light4;
  let light5;
  function animate(){
    requestAnimationFrame(animate);


    // Este código serve para esconder a lua ou o sol quando este não está por cima do mundo.
    sunMesh.visible = sunMesh.position.y >= 0;
    moonMesh.visible = moonMesh.position.y >= 0;

    if(!lightsCreated && !sunMesh.visible){
      light = new THREE.PointLight(0xff6600, 3, 10, 3); 
      light.position.set(22, 1, 10);
      scene.add(light);
    
      light1 =new THREE.PointLight(0xff6600, 3, 10, 3); 
      light1.position.set(22, 1, 20);
      scene.add(light1);
      
      //lamp
      light2 = new THREE.PointLight(0xff6600, 3, 10, 3); 
      light2.position.set(1, 1.1, 1);
      scene.add(light2);
    
      light3 =new THREE.PointLight(0xff6600, 3, 10, 3); 
      light3.position.set(25, 1.1, 1);
      scene.add(light3);

      light4 = new THREE.PointLight(0xff6600, 3, 10, 3); 
      light4.position.set(25, 1.1, 28);
      scene.add(light4);
    
      light5 =new THREE.PointLight(0xff6600, 3, 10, 3); 
      light5.position.set(1, 1.1, 28);
      scene.add(light5);

      lightsCreated = true;
    }

    if (lightsCreated && sunMesh.visible) {
 
      scene.remove(light);
      scene.remove(light1);
      scene.remove(light2);
      scene.remove(light3);
      scene.remove(light4);
      scene.remove(light5);

   
      lightsCreated = false;
  }

    //time += 0.0005;
    time += 0.001;

    
    sunMesh.rotation.y += 0.01;
    moonMesh.rotation.y += 0.01;

    const sunMeshX = Math.cos(time) * 40; 
    const sunMeshY = Math.sin(time) * 40;
    const moonMeshX = Math.cos(time + Math.PI) * 40;
    const moonMeshY = Math.sin(time + Math.PI) * 40;

    sunMesh.position.set(sunMeshX, sunMeshY, sunMesh.position.z);
    moonMesh.position.set(moonMeshX, moonMeshY, moonMesh.position.z);

    if (snowEffect) {
      snowEffect.animateSnow();
    }

    if (rainEffect) {
      rainEffect.animateRain();
    }

    if (sakuraEffect) {
      sakuraEffect.animateSakura();
    }

    updateBackground();
    
  }

  animate();

  function update(city) {
    for (let x = 0; x < city.size; x++) {
      for (let y = 0; y < city.size; y++) {
        const tile = city.tiles[x][y];
        const existingBuildingMesh = buildings[x][y];

        if (!tile.building && existingBuildingMesh) {
          scene.remove(existingBuildingMesh);
          buildings[x][y] = undefined;
        }
        if (tile.building && tile.building.updated) {
          scene.remove(existingBuildingMesh);
          buildings[x][y] = createAssetInstance(tile.building.type, x, y, tile.building);
          scene.add(buildings[x][y]);
          tile.building.updated = false;
        }
      }
    }
  }

  function setupLights() {
    const sun = new THREE.DirectionalLight(0xffffff, 1)
    sun.position.set(20, 20, 20);
    sun.castShadow = true;
    sun.shadow.camera.left = -10;
    sun.shadow.camera.right = 10;
    sun.shadow.camera.top = 0;
    sun.shadow.camera.bottom = -10;
    sun.shadow.mapSize.width = 1024;
    sun.shadow.mapSize.height = 1024;
    sun.shadow.camera.near = 0.5;
    sun.shadow.camera.far = 50;
    scene.add(sun);
    scene.add(new THREE.AmbientLight(0xffffff, 0.3));
  }

  function draw() {
    if (activeCamera === camera) {
      renderer.render(scene, camera.camera);
  } else if (activeCamera === FPcamera) {
      renderer.render(scene, FPcamera);
  }
  }

  function start() {
    renderer.setAnimationLoop(draw);
  }

  function stop() {
    renderer.setAnimationLoop(null);
  }

  function onResize() {
    camera.camera.aspect = gameWindow.offsetWidth / gameWindow.offsetHeight;
    camera.camera.updateProjectionMatrix();
    renderer.setSize(gameWindow.offsetWidth, gameWindow.offsetHeight);
  }


  function setHighlightedObject(object) {
    if (hoverObject && hoverObject !== activeObject) {
      setObjectEmission(hoverObject, 0x000000);
    }

    hoverObject = object;

    if (hoverObject) {
      setObjectEmission(hoverObject, 0x555555);
    }
  }

  function getSelectedObject(event) {
    mouse.x = (event.clientX / renderer.domElement.clientWidth) * 2 - 1;
    mouse.y = -(event.clientY / renderer.domElement.clientHeight) * 2 + 1;

    raycaster.setFromCamera(mouse, camera.camera);

    let intersections = raycaster.intersectObjects(scene.children, false);

    if (intersections.length > 0) {
      return intersections[0].object;
    } else {
      return null;
    }
  }

  function setActiveObject(object) {

    setObjectEmission(activeObject, 0x000000);
    activeObject = object;
    setObjectEmission(activeObject, 0xaaaa55);
  }

  function setObjectEmission(object, color) {
    if (!object) return;
    if (Array.isArray(object.material)) {
      object.material.forEach(material => material.emissive?.setHex(color));
    } else {
      object.material.emissive?.setHex(color);
    }
  }  
    
  return {
    camera,
    initialize,
    startRain,
    startSakura,
    stopSakura,
    stopRain,
    animateRain,
    update,
    start,
    stop,
    onResize,
    getSelectedObject,
    setActiveObject,
    setHighlightedObject
  }
}
