import * as THREE from 'three';
import { createCamera } from './camera.js';
import { createAssetInstance } from './assets.js';
import { GLTFLoader } from 'three/addons/loaders/GLTFLoader.js';

let rainEffect = null;
let sakuraEffect = null; 
let snowEffect = null;
const occupiedPositions = new Set();
const loadedModels = new Map();

export function createScene() {

  const gameWindow = document.getElementById('render-target');
  const scene = new THREE.Scene();
  const camera = createCamera(gameWindow);
  const renderer = new THREE.WebGLRenderer();
  scene.background = new THREE.Color(0x87ceeb);
  renderer.setSize(gameWindow.offsetWidth, gameWindow.offsetHeight);
  renderer.setClearColor(0x000000, 0);
  renderer.shadowMap.enabled = true;
  renderer.shadowMap.type = THREE.PCFSoftShadowMap;
  gameWindow.appendChild(renderer.domElement);

  const raycaster = new THREE.Raycaster();
  const mouse = new THREE.Vector2();


  let time = 0;

  let activeObject = undefined;
  let hoverObject = undefined;

  let buildings = [];

  const sunMesh = createAssetInstance('sun', 10, 10);
  const moonMesh = createAssetInstance('moon', 10, 10); 


  let starsAdded = false; 

  // ---------------------------- ADICIONAR NEVE A CAIR DURANTE A NOITE ------------------------------------------

  function createSnow() {
   
    const snowCount = 5000;
    const snowGeometry = new THREE.BufferGeometry();
    const snowMaterial = new THREE.PointsMaterial({
        color: 0xffffff,
        size: 1,
        transparent: false,
        opacity: 1
    });

   
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


    function animateSnow() {
        const positions = snow.geometry.attributes.position.array;
        for (let i = 1; i < positions.length; i += 3) {
            positions[i] -= 0.1; 
            if (positions[i] < -50) {
                positions[i] = 100; 
            }
        }
        snow.geometry.attributes.position.needsUpdate = true;
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
      
        scene.remove(snowEffect.snow);
        snowEffect = null;
    }
}



  // ---------------------------- ADICIONAR PETALAS DE SAKURA A CAIREM DURANTE O DIA -----------------------------


  function createSakura() {
    
    const sakuraCount = 5000;
    const sakuraGeometry = new THREE.BufferGeometry();
    const sakuraMaterial = new THREE.PointsMaterial({
        color: 0xffc0cb,
        size: 1,
        transparent: false,
        opacity: 1
    });


    const sakuraVertices = [];
    for (let i = 0; i < sakuraCount; i++) {
        const x = Math.random() * 200 - 100; 
        const y = Math.random() * 100 + 50;   
        const z = Math.random() * 200 - 100; 
        sakuraVertices.push(x, y, z);
    }
    sakuraGeometry.setAttribute('position', new THREE.Float32BufferAttribute(sakuraVertices, 3));
    const sakura = new THREE.Points(sakuraGeometry, sakuraMaterial);
    sakura.userData.ignoreSelection = true;

  
    function animateSakura() {
        const positions = sakura.geometry.attributes.position.array;
        for (let i = 1; i < positions.length; i += 3) {
            positions[i] -= 0.1; 
            if (positions[i] < -50) {
                positions[i] = 100; 
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

   

    scene.add(sunMesh);
    scene.add(moonMesh);

    setupLights();
  }

  // Inverno -> Primavera -> Verão -> Outono
  // Neve -> Noite
  // Sakura -> Dia
  // Raining -> Noite

  let currentWeather = "Sunny/Moony Season";

function getCurrentWeather() {
    return currentWeather;
}

function updateWeatherPanel() {
    const weatherTextElement = document.getElementById('weather-text');
    weatherTextElement.textContent = currentWeather;
}


function updateBackground() {
  const isNight = !sunMesh.visible;
  

  if (isNight) {
      addStarsToSky();
      scene.background.setHex(0x000022);
  } else {
      scene.background.setHex(0x87ceeb);
  }

  if (currentWeather === "Sakura Season") {
      startSakura();
  } else {
      stopSakura();
  }

  if (currentWeather === "Snowing Season") {
      startSnow();
  } else {
      stopSnow();
  }

  if (currentWeather === "Rainy Season") {
      startRain();
  } else {
      stopRain();
  }
}


// Mudança de tempo e efeito sonoro
var audio;

document.getElementById('sunny-button').addEventListener('click', function() {
    currentWeather = "Sunny/Moony Season";
    updateWeatherPanel();
    updateBackground();

    if(audio && !audio.paused) {
      audio.pause();
    }

    audio = new Audio();
    audio.src = "/audio/Sunny_sound.wav";
    audio.play();
});

document.getElementById('rainy-button').addEventListener('click', function() {
    currentWeather = "Rainy Season";
    updateWeatherPanel();
    updateBackground();

    if(audio && !audio.paused) {
      audio.pause();
    }

    audio = new Audio();
    audio.src = "/audio/rain_sound_ambience.wav";
    audio.play();

});

document.getElementById('snowing-button').addEventListener('click', function() {
    currentWeather = "Snowing Season";
    updateWeatherPanel();
    updateBackground();
    if(audio && !audio.paused) {
      audio.pause();
    }

    audio = new Audio();
    audio.src = "/audio/snow.mp3";
    audio.play();

});

document.getElementById('sakura-button').addEventListener('click', function() {
    currentWeather = "Sakura Season";
    updateWeatherPanel();
    updateBackground();
    if(audio && !audio.paused) {
      audio.pause();
    }

    audio = new Audio();
    audio.src = "/audio/sakura.mp3";
    audio.play();
    
});


updateWeatherPanel();
updateBackground();


//------------------------------ Try stuff out ---------------------------------------------



let selectedPosition = null; // Variável para guardar a posição selecionada

function enableTileSelectionMode() {
    renderer.domElement.addEventListener('click', onTileClick);
}

function onTileClick(event) {
  
    const mouseCoords = getMouseCoordinates(event);

    raycaster.setFromCamera(mouseCoords, camera.camera);
    const intersects = raycaster.intersectObjects(scene.children);

    if (intersects.length > 0) {
        selectedPosition = intersects[0].object.position;
        console.log('Selected position:', selectedPosition);
        updateInformationPanel();
    }
}

// Função para receber coordenadas do rato
function getMouseCoordinates(event) {
    const rect = renderer.domElement.getBoundingClientRect();
    const x = ((event.clientX - rect.left) / rect.width) * 2 - 1;
    const y = -((event.clientY - rect.top) / rect.height) * 2 + 1;
    return new THREE.Vector2(x, y);
}


// Permite a escolha de Tile para construção desde o inicio do jogo.
enableTileSelectionMode();

const lanternButtonupload = document.getElementById('button-lantern');
lanternButtonupload.addEventListener('click', function() {
    if (selectedPosition) {
        loadLanternModel(selectedPosition);
    } else {
        console.log('Please select a tile first.');
    }
});



const houseButtonupload = document.getElementById('button-home');
houseButtonupload.addEventListener('click', function() {
  
    if (selectedPosition) {
        loadHouseModel(selectedPosition);
    } else {
        console.log('Please select a tile first.');
    }
});

const treeButtonupload = document.getElementById('button-tree');
treeButtonupload.addEventListener('click', function() {
   
    if (selectedPosition) {
        load3DTree(selectedPosition);
    } else {
        console.log('Please select a tile first.');
    }
});

const windMillButtonupload = document.getElementById('button-windmill');
windMillButtonupload.addEventListener('click', function() {

    if (selectedPosition) {
        load3DWindMill(selectedPosition);
    } else {
        console.log('Please select a tile first.');
    }
});

const toriiButtonupload = document.getElementById('button-torii');
toriiButtonupload.addEventListener('click', function() {
 
    if (selectedPosition) {
        load3DTorii(selectedPosition);
    } else {
        console.log('Please select a tile first.');
    }
});

const benchButtonupload = document.getElementById('button-bench');
benchButtonupload.addEventListener('click', function() {
   
    if (selectedPosition) {
        load3DBench(selectedPosition);
    } else {
        console.log('Please select a tile first.');
    }
});

const pagodaButtonupload = document.getElementById('button-road');
pagodaButtonupload.addEventListener('click', function() {

    if (selectedPosition) {
        load3DPagoda(selectedPosition);
    } else {
        console.log('Please select a tile first.');
    }
});

const arcadeButtonupload = document.getElementById('button-arcade');
arcadeButtonupload.addEventListener('click', function() {

    if (selectedPosition) {
        load3DArcade(selectedPosition);
    } else {
        console.log('Please select a tile first.');
    }
});

const vendingMachineButtonupload = document.getElementById('button-vendingmachine');
vendingMachineButtonupload.addEventListener('click', function() {

    if (selectedPosition) {
        load3DVendingMachine(selectedPosition);
    } else {
        console.log('Please select a tile first.');
    }
});

function isPositionOccupied(position) {
  const positionKey = `${position.x},${position.y},${position.z}`;
  return occupiedPositions.has(positionKey);
}


function updateInformationPanel(customString) {
  const informationPanel = document.getElementById('info-panel');
  if (customString) {
      informationPanel.textContent = customString;
  } else {
      informationPanel.textContent = "Grass: Ah, the scent of freshly cut grass, such a nostalgic embrace.";
  }
}

const cityNameElement = document.getElementById('city-name');

cityNameElement.addEventListener('input', function() {
    const newCityName = cityNameElement.textContent.trim();
    updateCityName(newCityName);
});

function updateCityName(newCityName) {
    console.log('City name updated:', newCityName);
}


function deleteModel(position) {
  const positionKey = `${position.x},${position.y},${position.z}`;
  const modelToRemove = loadedModels.get(positionKey);

  if (modelToRemove) {
      scene.remove(modelToRemove);
      occupiedPositions.delete(positionKey);
      loadedModels.delete(positionKey);
      console.log(`Removed model at position: ${positionKey}`);
  } else {
      console.log(`No model found at position: ${positionKey}`);
  }
}



function rotateModel(position, angle) {
  const positionKey = `${position.x},${position.y},${position.z}`;
  const modelToRotate = loadedModels.get(positionKey);

  if (modelToRotate) {
    modelToRotate.rotation.y += angle;
    console.log(`Rotated model at position: ${positionKey}`);
  } else {
    console.log(`No model found at position: ${positionKey}`);
  }
}

const rotateButton = document.getElementById('rotate-button');
rotateButton.addEventListener('click', function() {
    if (selectedPosition) {
        rotateModel(selectedPosition, Math.PI / 2);
    } else {
        console.log('Please select a tile first.');
    }
});


const bulldozeButton = document.getElementById('button-bulldoze');
bulldozeButton.addEventListener('click', function() {
    if (selectedPosition) {
        deleteModel(selectedPosition);
    } else {
        console.log('Please select a tile first.');
    }
});


function loadHouseModel(position) {
  if (position.x === 0 && position.y === 0 && position.z === 0) {
    console.log('Skipping loading model at position 0,0,0.');
    return;
}
 // Verificação, se a posição já está ocupada antes de carregar o modelo
  if (!isPositionOccupied(position)) {
      const houseUrl = './modelos/house.glb';
      const gtlloaderHouse = new GLTFLoader();

      gtlloaderHouse.load(
          houseUrl,
          function (gltf) {
              const houseModel = gltf.scene;
              houseModel.position.copy(position);
              houseModel.scale.set(1.2, 1.2, 1.2);
              houseModel.position.y = 0;
              scene.add(houseModel);

              const positionKey = `${position.x},${position.y},${position.z}`;
              occupiedPositions.add(positionKey);
              loadedModels.set(positionKey, houseModel);
              console.log("Loaded models:", loadedModels);
              updateInformationPanel("House: A good looking house, reminds me of home. I wonder who lives here.");

          },
          function (xhr) {
              console.log((xhr.loaded / xhr.total) * 100 + '% loaded');
          },
          function (error) {
              console.log('An error happened');
          }
      );
  } else {
      console.log('This position is already occupied by a model.');
  }
}

function loadLanternModel(position) {
  if (position.x === 0 && position.y === 0 && position.z === 0) {
    console.log('Skipping loading model at position 0,0,0.');
    return;
}
 // Verificação, se a posição já está ocupada antes de carregar o modelo
  if (!isPositionOccupied(position)) {
      const houseUrl = './modelos/redLantern.glb';
      const gtlloaderHouse = new GLTFLoader();

      gtlloaderHouse.load(
          houseUrl,
          function (gltf) {
              const lantern = gltf.scene;
              lantern.position.copy(position);
              lantern.scale.set(1.2, 1.2, 1.2);
              lantern.position.y = 0.5;
              scene.add(lantern);

              const positionKey = `${position.x},${position.y},${position.z}`;
              occupiedPositions.add(positionKey);
              loadedModels.set(positionKey, lantern);
              console.log("Loaded models:", loadedModels);
              updateInformationPanel("Red Latern: A traditional Lantern. I heard it's used in some festivals around the world.");

          },
          function (xhr) {
              console.log((xhr.loaded / xhr.total) * 100 + '% loaded');
          },
          function (error) {
              console.log('An error happened');
          }
      );
  } else {
      console.log('This position is already occupied by a model.');
  }
}

function load3DTree(position) {

  console.log('Checking position:', position);
  console.log('Occupied positions:', occupiedPositions);

  if (position.x === 0 && position.y === 0 && position.z === 0) {
    console.log('Skipping loading model at position 0,0,0.');
    return;
  }

  // Verificação, se a posição já está ocupada antes de carregar o modelo
  if (!isPositionOccupied(position)) {
  const gtlloaderTree = new GLTFLoader();

  gtlloaderTree.load(
  
      './modelos/tree.glb',

      function (gltf) {
          const tree = gltf.scene;

          tree.position.copy(position);
          tree.scale.set(0.5, 0.5, 0.5);
          tree.position.y = 0;
          scene.add(gltf.scene);

          const positionKey = `${position.x},${position.y},${position.z}`;
          occupiedPositions.add(positionKey);
          loadedModels.set(positionKey, tree);
          console.log("Loaded models:", loadedModels);
          updateInformationPanel("Tree: A normal looking Tree. It looks old, maybe a few centuries old.");

      },
      function (xhr) {
          console.log((xhr.loaded / xhr.total * 100) + '% loaded');
      },
      function (error) {
          console.log('An error happened');
      }
  );
  } else {
    console.log('This position is already occupied by a model.');
  }
}


function load3DWindMill(position) {
  if (position.x === 0 && position.y === 0 && position.z === 0) {
    console.log('Skipping loading model at position 0,0,0.');
    return;
}

  if (!isPositionOccupied(position)) {
  const gtlloaderWindMill = new GLTFLoader();
  gtlloaderWindMill.load(
  
      './modelos/wind.glb',
   
      function (gltf) {
          const windmill = gltf.scene;
          windmill.position.copy(position);
          scene.add(gltf.scene);
          windmill.position.y = 0;
          
          const positionKey = `${position.x},${position.y},${position.z}`;
          occupiedPositions.add(positionKey);
          loadedModels.set(positionKey, windmill);
          console.log("Loaded models:", loadedModels);

          updateInformationPanel("Windmill: You can hear the wind blowing around you.");
      },
    
      function (xhr) {
          console.log((xhr.loaded / xhr.total * 100) + '% loaded');
      },
   
      function (error) {
          console.log('An error happened');
      }
  );
  } else {
    console.log('This position is already occupied by a model.');
  }
}

function load3DTorii(position){
  if (position.x === 0 && position.y === 0 && position.z === 0) {
    console.log('Skipping loading model at position 0,0,0.');
    return;
  }

  if (!isPositionOccupied(position)) {
  const gtlloaderTorii = new GLTFLoader();

  gtlloaderTorii.load(

    './modelos/torii.glb',

    
    function ( gltf ) {
      const torii = gltf.scene;
      torii.position.copy(position);
      torii.scale.set(1.4, 1.4, 1.4);
      torii.position.y = 0;
      scene.add( gltf.scene );

      const positionKey = `${position.x},${position.y},${position.z}`;
      occupiedPositions.add(positionKey);
      loadedModels.set(positionKey, torii);
      console.log("Loaded models:", loadedModels);

      updateInformationPanel("Torii: The japanese entrance to a sacred place. You somehow feel calmer around it.");
    },

    function ( xhr ) {
      console.log( ( xhr.loaded / xhr.total * 100 ) + '% loaded' );
    },

    function ( error ) {
      console.log( 'An error happened' );
    }
  );
  }else{
    console.log('This position is already occupied by a model.');
  }
  }

function load3DBench(position){
  if (position.x === 0 && position.y === 0 && position.z === 0) {
    console.log('Skipping loading model at position 0,0,0.');
    return;
}

  if (!isPositionOccupied(position)) {

  const gtlloaderBench = new GLTFLoader();

  gtlloaderBench.load(

    './modelos/bench.glb',


    function ( gltf ) {
      const bench = gltf.scene;
      bench.position.copy(position);
      bench.scale.set(1.5, 1.5, 1.5);
      bench.position.y = 0;
      scene.add( gltf.scene );


      const positionKey = `${position.x},${position.y},${position.z}`;
      occupiedPositions.add(positionKey);
      loadedModels.set(positionKey, bench);
      console.log("Loaded models:", loadedModels);

      updateInformationPanel("Bench: Oh nice, a bench, my legs were starting to feel a bit tired.");
    },

    function ( xhr ) {
      console.log( ( xhr.loaded / xhr.total * 100 ) + '% loaded' );
    },
 
    function ( error ) {
      console.log( 'An error happened' );
    }
  );
} else {
  console.log('This position is already occupied by a model.');
}
}

function load3DArcade(position) {
  if (position.x === 0 && position.y === 0 && position.z === 0) {
    console.log('Skipping loading model at position 0,0,0.');
    return;
}
  if (!isPositionOccupied(position)) {
      const gtlloaderArcade = new GLTFLoader();

      gtlloaderArcade.load(
 
          './modelos/arcadeMachine.glb',

         
          function (gltf) {
              const arcade = gltf.scene;
              arcade.position.copy(position);
              arcade.scale.set(0.7, 0.7, 0.7);
              arcade.position.y = 0;
              scene.add(gltf.scene);

              const positionKey = `${position.x},${position.y},${position.z}`;
              occupiedPositions.add(positionKey);
              loadedModels.set(positionKey, arcade);
              console.log("Loaded models:", loadedModels);

              updateInformationPanel("Arcade: The oldschool way of playing games, my father used to play these with his friends back in the day.");
          },
     
          function (xhr) {
              console.log((xhr.loaded / xhr.total * 100) + '% loaded');
          },
     
          function (error) {
              console.log('An error happened');
          }
      );
  } else {
      console.log('This position is already occupied by another building.');
  }
}


function load3DPagoda(position) {
  if (position.x === 0 && position.y === 0 && position.z === 0) {
    console.log('Skipping loading model at position 0,0,0.');
    return;
}
  if (!isPositionOccupied(position)) {
      const gtlloaderPagoda = new GLTFLoader();

      gtlloaderPagoda.load(
    
          './modelos/pagoda.glb',

    
          function (gltf) {
              const pagoda = gltf.scene;
              pagoda.position.copy(position);
              pagoda.scale.set(0.05, 0.05, 0.05);
              pagoda.position.y = 0;
              scene.add(gltf.scene);

              const positionKey = `${position.x},${position.y},${position.z}`;
              occupiedPositions.add(positionKey);
              loadedModels.set(positionKey, pagoda);
              console.log("Loaded models:", loadedModels);

              updateInformationPanel("Pagoda: Woah, a pagoda, its gigantic, the multiple layers are so cool!");
          },
   
          function (xhr) {
              console.log((xhr.loaded / xhr.total * 100) + '% loaded');
          },
      
          function (error) {
              console.log('An error happened');
          }
      );
  } else {
      console.log('This position is already occupied by another building.');
  }
}


function load3DVendingMachine(position){
  if (position.x === 0 && position.y === 0 && position.z === 0) {
    console.log('Skipping loading model at position 0,0,0.');
    return;
}

  if (!isPositionOccupied(position)) {
  const gtlloaderVendingMachine = new GLTFLoader();

  gtlloaderVendingMachine.load(

    './modelos/vendingMachine.glb',


    function ( gltf ) {
      const vendingMachine = gltf.scene;
      vendingMachine.position.copy(position);
      vendingMachine.scale.set(0.4, 0.4, 0.4);
      vendingMachine.position.y = 0;
      scene.add( gltf.scene );

      const positionKey = `${position.x},${position.y},${position.z}`;
      occupiedPositions.add(positionKey);
      loadedModels.set(positionKey, vendingMachine);
      console.log("Loaded models:", loadedModels);

      updateInformationPanel("Vending Machine: A vending machine, after a closer look, its filled with snacks.");

    },
  
    function ( xhr ) {
      console.log( ( xhr.loaded / xhr.total * 100 ) + '% loaded' );
    },
  
    function ( error ) {
      console.log( 'An error happened' );
    }
  );
  } else {
    console.log('This position is already occupied by a model.');
  }
}


// ------------------------------- End try stuff out----------------------------


  function animate(){
    requestAnimationFrame(animate);

    // Este código serve para esconder a lua ou o sol quando este não está por cima do mundo.
    sunMesh.visible = sunMesh.position.y >= 0;
    moonMesh.visible = moonMesh.position.y >= 0;

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

    updateWeatherPanel();

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

    renderer.render(scene, camera.camera);
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
    renderer.render(scene, camera.camera);
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