import * as THREE from 'three';

const cubo = new THREE.BoxGeometry(1, 1, 1); // Definir cubo para o chão.
const esferaSol = new THREE.SphereGeometry(5, 20, 20); // Definir esfera para o Sol.
const esferaLua = new THREE.SphereGeometry(5, 20, 20); // Definir esfera para a Lua.

let loader = new THREE.TextureLoader(); // Loader de texturas.


function loadTexture(url) {
  const tex = loader.load(url)
  tex.wrapS = THREE.RepeatWrapping;
  tex.wrapT = THREE.RepeatWrapping;
  tex.repeat.set(1, 1);
  return tex;
}

// Definir as diferentes texturas com imagens externas.
const textures = {
    'grass': loadTexture('./textures/relva.jpg'), // Textura usada para o chão.
    'snow': loadTexture('./textures/neve.png'), 
    'petals': loadTexture('./textures/petalas.png'),


    'sun': loadTexture('./textures/sun.jpg'),
    'moon': loadTexture('./textures/moon.jpg'),

    'road' : loadTexture('./textures/road.jpg'),

    'home1': loadTexture('./textures/edificio1.png'),
    'home2': loadTexture('./textures/edificio1.png'),
    'home3': loadTexture('./textures/edificio1.png'),

    'tree1': loadTexture('./textures/edificio2.png'),
    'tree2': loadTexture('./textures/edificio2.png'),
    'tree3': loadTexture('./textures/edificio2.png'),

    'vendingMachine1': loadTexture('./textures/edificio3.png'),
    'vendingMachine2': loadTexture('./textures/edificio3.png'),
    'vendingMachine3': loadTexture('./textures/edificio3.png'),

    'windmill1': loadTexture('./textures/edificio3.png'),
    'windmill2': loadTexture('./textures/edificio3.png'),
    'windmill3': loadTexture('./textures/edificio3.png'),

    'torii1': loadTexture('./textures/torii.jpg'),
    'torii2': loadTexture('./textures/torii.jpg'),
    'torii3': loadTexture('./textures/torii.jpg'),

    'bench1': loadTexture('./textures/bench.jpg'),
    'bench2': loadTexture('./textures/bench.jpg'),
    'bench3': loadTexture('./textures/bench.jpg'),

    'wall1': loadTexture('./textures/edificio1.png'),
    'wall2': loadTexture('./textures/edificio1.png'),
    'wall3': loadTexture('./textures/edificio1.png'),

    'arcade1': loadTexture('./textures/edificio3.png'),
    'arcade2': loadTexture('./textures/edificio3.png'),
    'arcade3': loadTexture('./textures/edificio3.png'),

  };

// Função que retorna a parte de cima das construções com textura, que são os muros.
function receberTexturaCima() {
  return new THREE.MeshLambertMaterial({ color: 0x555555 });
}

// Função que retorna a parte de lado das construções com textura, que são os muros.
function receberTexturaLado(nomeTextura) {
  return new THREE.MeshLambertMaterial({ map: textures[nomeTextura].clone() })
}

// Função para criação de uma instancia de uma construção.
export function createAssetInstance(type, x, y, data) {
  if (type in assets) {
    return assets[type](x, y, data);
  } else {
    console.warn(`Este tipo ${type} não foi encontrado.`);
    return undefined;
  }
}

// Todos os assets disponiveis, que vão usar as texturas acima.
const assets = {
  'sun': (x, y) => {
    const material = new THREE.MeshLambertMaterial({ map: textures.sun });
    const mesh = new THREE.Mesh(esferaSol, material);
    mesh.userData = { x, y };
    mesh.position.set(8, 40, 8);
    mesh.receiveShadow = false;
    return mesh;
  },
  

  'moon': (x, y) => {
    const material = new THREE.MeshLambertMaterial({ map: textures.moon });
    const mesh = new THREE.Mesh(esferaLua, material);
    mesh.userData = { x, y };
    mesh.position.set(8, -40, 8); 
    mesh.receiveShadow = false;
    return mesh;
  },

  'grass': (x, y) => {
    const material = new THREE.MeshLambertMaterial({ map: textures.grass });
    const mesh = new THREE.Mesh(cubo, material);
    mesh.userData = { x, y };
    mesh.position.set(x, -0.5, y);
    mesh.receiveShadow = true;
    return mesh;
  },

  'snow': (x, y) => {
    const material = new THREE.MeshLambertMaterial({ map: textures.snow });
    const mesh = new THREE.Mesh(cubo, material);
    mesh.userData = { x, y };
    mesh.position.set(x, -0.5, y);
    mesh.receiveShadow = true;
    return mesh;
  },

  'petals': (x, y) => {
    const material = new THREE.MeshLambertMaterial({ map: textures.petals });
    const mesh = new THREE.Mesh(cubo, material);
    mesh.userData = { x, y };
    mesh.position.set(x, -0.5, y);
    mesh.receiveShadow = true;
    return mesh;
  },


  // 'home': (x, y, data) => createZoneMesh(x, y, data),
  // 'tree': (x, y, data) => createZoneMesh(x, y, data),
  // 'vendingMachine': (x, y, data) => createZoneMesh(x, y, data),
  // 'windmill': (x, y, data) => createZoneMesh(x, y, data),
  // 'torii': (x, y, data) => createZoneMesh(x, y, data),
  // 'bench': (x, y, data) => createZoneMesh(x, y, data),
  'wall': (x, y, data) => createZoneMesh(x, y, data),
  // 'arcade': (x, y, data) => createZoneMesh(x, y, data),

}

function createZoneMesh(x, y, data) {
  const nomeTextura = data.type + data.style;
  const texturaCima = receberTexturaCima();
  const texturaLado = receberTexturaLado(nomeTextura);

  // Definir os lados do cubo que irá ter as texturas.
  let arrayTextura = [
    texturaLado, 
    texturaLado, 
    texturaCima, 
    texturaCima, 
    texturaLado, 
    texturaLado, 
  ];

  let mesh = new THREE.Mesh(cubo, arrayTextura);
  mesh.userData = { x, y };
  mesh.scale.set(1, (data.height - 0.95) / 2, 1);
  mesh.material.forEach(material => material.map?.repeat.set(1, data.height - 1));
  mesh.position.set(x, (data.height - 0.95) / 4, y);
  mesh.castShadow = true;
  mesh.receiveShadow = true;
  return mesh;
}