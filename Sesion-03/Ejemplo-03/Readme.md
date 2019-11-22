`Data Science` > [`Programacion con R`]
## Funciones, condiciones y loops

### OBJETIVO
- Aprender a hacer un loop con WHILE 

#### REQUISITOS
1. Contar con R studio.
1. Usar la carpeta de trabajo `Sesion03/Ejemplo-03`

#### DESARROLLO

Creemos una lista de precios que asociaremos a nuestros productos. Iniciaremos por un valor de 20MXN y crearemos una funcion para que incrementen en 5MXN hasta llegar a un precio de 2500MXN. 

```{r}
precio <- 20

while(precio <= 2500){
  print(precio)
  precio <- precio + 5 
}


```
