import * as THREE from "three";
export function createCamera(gameWindow){

    // Transformar graus em Radianos
    const grauParaRadiano = Math.PI/180.0;
    // Instanciação do botão do meio que permite o Zoom in e out
    const botao_rato_meio = 4;
    // Instanciação do botão da direita que permite a rotação sobre a secção central da camera
    const bota_rato_direita = 2;

    // Valor minimo do raio da camera
    const raio_min_camera = 10;
    // Valor máximo do raio da camera
    const raio_max_camera = 150;
    // Valor minimo da elevação da camera
    const elevacao_min_camera = 10;
    // Valor máximo da elevação da camera
    const elevacao_max_camera = 90;

    // Instanciacao de valores relacionados com sensibilidades
    const sensibilidade_angulo = 0.2;
    const sensibilidade_elevacao = 0.2;
    const sensibilidade_zoom = 0.01;
    const sensibilidade_panorama = -0.01;

    // Definir o eixo do Y
    const eixo_y = new THREE.Vector3(0, 1, 0);

    // Definir a camera como perspetiva
    const camera = new THREE.PerspectiveCamera(45, gameWindow.offsetWidth / gameWindow.offsetHeight, 0.1, 1000);

    // Instanciar a origem da camera
    let origemCamera = new THREE.Vector3(6,0,6);
    // Instanciar o raio da Camera inicial
    let raioCamera = 30;
    // Instanciar o angulo da Camera inicial
    let anguloCamera = 135;
    // Instanciar a elevacao da Camera inicial
    let elevacaoCamera = 45;

    // Chamada da função, que permite a atualização da posição de camera
    updateCameraPosition();

    // Função que permite a rotação e movimentação da camera
    function onMouseMove(event) {
        if (event.buttons & bota_rato_direita) {
          anguloCamera += -(event.movementX * sensibilidade_angulo);
          elevacaoCamera += (event.movementY * sensibilidade_elevacao);
          elevacaoCamera = Math.min(elevacao_max_camera, Math.max(elevacao_min_camera, elevacaoCamera));
        }
    
        if (event.buttons & botao_rato_meio) {
          const forward = new THREE.Vector3(0, 0, 1).applyAxisAngle(eixo_y, anguloCamera * grauParaRadiano);
          const left = new THREE.Vector3(1, 0, 0).applyAxisAngle(eixo_y, anguloCamera * grauParaRadiano);
          origemCamera.add(forward.multiplyScalar(sensibilidade_panorama * event.movementY));
          origemCamera.add(left.multiplyScalar(sensibilidade_panorama * event.movementX));
        }
        // Chamada da função, que permite a atualização da posição de camera
        updateCameraPosition();
      }

      // Função que permite alterar o zoom da camera
      function onMouseScroll(event) {
        raioCamera += event.deltaY * sensibilidade_zoom;
        raioCamera = Math.min(raio_max_camera, Math.max(raio_min_camera, raioCamera));
      }

    // Função que permite a atualização da posicao da camera
    function updateCameraPosition(){
        camera.position.x = raioCamera * Math.sin(anguloCamera * grauParaRadiano) * Math.cos(elevacaoCamera*grauParaRadiano);
        camera.position.y = raioCamera * Math.sin(elevacaoCamera * grauParaRadiano);
        camera.position.z = raioCamera * Math.cos(anguloCamera * grauParaRadiano) * Math.cos(elevacaoCamera*grauParaRadiano);
        camera.position.add(origemCamera);
        camera.lookAt(origemCamera);
        camera.updateMatrix();
    }

    return{
        camera, updateCameraPosition, onMouseMove, onMouseScroll
    }
}