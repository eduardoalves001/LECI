export function createCity(size){ // Função responsável pela criação da cidade
    const tiles = []; // Array de informação 2D. Cada elemento do array contêm um objeto. Objeto = tile.
    initialize();
    function initialize(){
        for(let x = 0; x < size; x++){
            const column = [];
            for(let y = 0; y < size; y++){
                // Cada localização na grid. Cada tile contém as coordenadas x e y.
                const tile = createTile(x , y);
                column.push(tile); 
            }
            tiles.push(column); // adicionar ao array data após construir uma coluna.
        }
    }

    function update() {
        let x, y;
        for (x = 0; x < size; x++) {
            for (y = 0; y < size; y++) {
                if (tiles[x][y] && tiles[x][y].building) {
                    tiles[x][y].building.update();
                }
            }
        }
    }

    return{
        size, tiles, update
    }
}

function createTile(x, y){
    return {
        x,
        y,
        terrainId: 'grass',
        terrainId2: 'snow',
        terrainId3: 'petals',
        building:undefined,
    }; 
}