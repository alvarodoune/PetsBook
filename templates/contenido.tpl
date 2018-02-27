<h1>{$categoria.nombre}</h1>
<div>
    <div>
        {foreach from=$productos item=prod}
            <div class="divProducto">
                <img class="img-producto" src="{$prod.imagen}" />
                <div>
                    <a href="./productos.php?id={$prod.id}">
                        <h2>{$prod.nombre}</h2>
                    </a>
                    <p>{$prod.descripcion}</p>
                </div>
            </div>
        {/foreach}
    </div>
    <button id="primero">Primero</button>
    {if ($mostrarAnterior)}
        <button id="anterior">Anterior</button>
    {/if}
    {if ($mostrarSiguiente)}
        <button id="siguiente">Siguiente</button>
    {/if}
    <button id="ultimo">Ultimo</button>
    <input type="hidden" value="{$total}" id="total">
</div>