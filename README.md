# Cash Transfers and Cognitive Development: Predicción y análisis

## Índice
1.	Resumen
2.	Introducción
    2.1.	Programa Atención a Crisis
    2.2.	Metodología del estudio
3.	*Capstone project*: Motivación y objetivos
4.	Exploración preliminar de datos
5.	Metodlogía y análisis
    5.1.	Primer enfoque: predicción del efecto causal
    5.2.    Cálculo de ITE: modelos de predicción
    5.3.	Segundo enfoque: estimación de efecto condicional
    5.4.    Cálculo de CATE: honest causal forest
6.	Resultados
7.	Conclusión
8.	Bibliografía


## 1. Resumen

[...]

## 2.	Introducción

El desarrollo en los primeros años de vida es un predictor importante del éxito a lo largo de la vida. Tanto en países desarrollados como en desarrollo, los niños con un nivel de desarrollo cognitivo menor antes de entrar al sistema educativo tienen un peor desempeño escolar y obtienen un nivel salarial más bajo (Currie and Thomas 2001; Case and Paxson 2008). En este contexto, diseñar política pública que sea capaz de reducir los niveles de subdesarrollo de los niños debería ser una prioridad, ya que no solamente tiene efectos en el bienestar actual de los infantes sino también en su futuro y el de su comunidad.

A pesar de la importancia de asegurar un desarrollo cognitivo y físico saludable entre los más pequeños, los recursos económicos de los cuales disponen los gobiernos son limitados. Esta problemática es particularmente relevante para los países en desarrollo. Para garantizar un mayor nivel de eficiencia y equidad no solamente es relevante saber si dicha política pública es efectiva, sino también el efecto que tiene para grupos con diferentes características. De esta forma es posible identificar los individuos que se verían más beneficiados de recibir una ayuda pública (mayor eficiencia) y los grupos a los cuales es más urgente ayudar para garantizar un mayor nivel de equidad.


###     2.1.	Programa *Atención a Crisis*

[intro Macours et al; objetivos + proceso; resultados]
![AtencionACrisis01](./assets/images/AaC_info_1.png?raw=true | width=500)
![AtencionACrisis02](./assets/images/AaC_info_2.png?raw=true | width=500)

###     2.2.	Metodología del estudio

El artículo “Cash Transfers, Behavioral Changes,and Cognitive Development in Early Childhood: Evidence from a Randomized Experiment” (Macours 2012) supone una primera aproximación para evaluar los efectos de *Atención a Crisis*. El objetivo de los autores de este estudio es determinar el efecto de ser tratado sobre el desarrollo cognitivo y físico. De este modo, lo que se pretende estimar es la diferencia en el desarrollo entre los individuos que han recibido la compensación económica (tratamiento) *versus* otros individuos con característica similares que no (control). 

La metodología aplicada en el artículo estima el efecto causal de ser beneficiario de Atención a Crisis mediante un simple análisis de regresión del tipo:

<center> Y<sub>i</sub> = &beta;<sub>0</sub> + &beta;<sub>1</sub>T<sub>i</sub> + &beta;<sub>k</sub>X<sub>ki</sub> + u<sub>i</sub></center>

Donde:
Y<sub>i</sub>=Puntuación en términos de desarrollo cognitivo y físico.  
T<sub>i</sub>=Variable binaria que igual a 1 para los individuos que han recibido la ayuda de Atención a Crisis (tratados) e igual a 0 del contrario (control).  
X<sub>ki</sub>= Vector de k regresores para controlar por características de los individuos.  
u<sub>i</sub>= Resto de características no incluidas en el modelo que también pueden tener efecto sobre la variable Y_i (por ej. Factores genéticos).  

El diseño experimental de Atanción a Crisis implica una serie de características que facilitan la estimación del efecto causal de ser tratado mediante el análisis de regresión. En primer lugar, asignar los individuos a grupos de tratamiento o de control de forma aleatoria, como si de una lotería se tratase, supone que no existe correlación entre ser tratado y otras características no observadas de los individuos. Esto es, E(u_i│T_i )=0. Al cumplirse esta propiedad se puede asumir que el coeficiente estimado β_1 no esta sesgado y representa de forma acurada el verdadero valor poblacional de recibir el tratamiento. En segundo lugar, los individuos de la muestra forman parte de una misma población y han sido seleccionados de forma aleatoria, implicando que los estimadores de mínimos cuadrados ordinarios (MCO) son consistentes. 

Ambas propiedades permiten a los autores interpretar el coeficiente de β_1 como el efecto causal medio de ser tratado versus no ser tratado. Este efecto se conoce en la literatura como Average Treatment Effect (ATE) y representa la diferencia de medias entre el grupo de tratamiento y control:

ATE=Y ̅_1-Y ̅_0

Donde:
 Y ̅_1=Puntuación media de los individuos tratados.
Y ̅_0=Puntuación media de los individuos no tratados.

Los resultados del estudio muestran que el ATE=0.0876, significante a un nivel de significación del 99%. Teniendo en cuenta que Y_i está mesurada en un z-score, con media 0 i desviación estándar de 1, podemos concluir que el beneficio medio de recibir Atención a Crisis es un incremento del 8.76% desviaciones estándares en el desarrollo cognitivo y físico.

El objetivo de este articulo no es predictivo ya que simplemente pretende estimar el efecto causal de recibir la compensación económica. Dado el diseño del programa dicho efecto podría calcularse simplemente con una regresión simple incluyendo la variable tratamiento (T_i) y un intercepto (β_0). De hecho, el vector de variables de control X_ki simplemente se incluye para controlar las diferencias existentes entre los grupos de control y tratamiento debidas a un número de observaciones relativamente bajo. Por este motivo no resulta especialmente relevante obtener unas medidas de ajuste como el R^2. A pesar de ello hemos decidido replicar el análisis realizado por los autores (siguiendo las indicaciones metodológicas y de tratamiento de datos mencionados en el artículo) para obtener las principales medidas de bondad de ajuste de los modelos de regresión y que nos sirvan como base sobre la cual sofisticar nuestro análisis. La media del error de estimación al cuadrado es de  y el R^2 es de 0.17.

## 3.	*Capstone project*: Motivación y objetivos

El ATE resulta muy útil para estimar la eficacia media de un tratamiento, pero no nos informa del efecto que el tratamiento tiene para cada individuo. Podría ser que el efecto del tratamiento fuese difiriera significativamente entre grupos con diferentes características, haciendo que el ATE sea en realidad poco informativo. Es más, de existir estas diferencias, sería interesante poder crear un modelo que permita capturar la heterogeneidad en la respuesta al tratamiento, indicando a qué grupos de la población se debería focalizar la política pública. 

## 4.	Exploración preliminar de datos
## 5.	Análisis

###    5.1 Primer enfoque: predicción del efecto causal

En la tradición de los “potential outcomes”, un efecto causal se define como la comparación entre dos estados del mundo. El primer estado del mundo es el que se conoce como el actual y es el mundo tal y como lo observamos (el individuo i recibe la ayuda de Atención a Crisis). El segundo estado del mundo es el que llamamos contrafactual (el mismo individuo i no recibe la ayuda de Atención a Crisis). De acuerdo con esta tradición de pensamiento, el efecto causal de recibir la ayuda de Atención a Crisis es la diferencia en el desarrollo cognitivo y físico entre los dos estados del mundo:

δ_i=Y_i^1-Y_i^0

Donde:
δ_i=El efecto del tratamiento para el individuo i, Individual Treatment Effect (ITE)
Y_i^1=Resultado del individuo i en el estado del mundo donde ha recibido el tratamiento.
Y_i^0=Resultado del individuo i en el estado del mundo donde no ha recibido el tratamiento.

Destacar que el ATE no es otra cosa que la media de δ_i.

La complejidad a la hora de estimar δ_i es que el resultado en el mundo contrafactual no se observa. Sin embargo, el uso de modelos de Machine Learning bien entrenados podría predecir la variable outcome (Y_i) para el estado del mundo contrafactual. 
Debido a las pocas observaciones con disponibles en el dataset (N=3141) hemos decidido aplicar un modelo de regresión múltiple y un modelo de “extreme gradient boosting”. (…)

Paralelamente, hemos aplicado un modelo de Random Decision Tree (RDT) siguiendo la metodología aplicada en Lamont et al. (2016). (…)
Mediante el modelo que presente una mayor tasa de acierto en la predicción pretendemos estimar el contrafactual de cada individuo, obteniendo de esta forma δ_i. Una vez capturado el efecto del tratamiento individual (ITE) tenemos la capacidad de estudiar las características de los individuos por los cuales es más beneficioso el tratamiento.


###     5.2.	Cálculo de ITE: modelos de predicción

###     5.3.	Segundo enfoque: estimación de efecto condicional

La metodología anterior, a pesar de ser intuitiva, no está exenta de problemas. En primer lugar, es necesario un modelo predictivo con una alta tasa de acierto si se pretende obtener resultados informativos. Debido a que los datos utilizados en el presente estudio son los mismos que en Crépon et al. (2014), cuyo objetivo era obtener una relación causal y no predecir, existe un número bajo de variables en la base de datos con un alto nivel predictivo. Es más, probablemente las variables más importantes para determinar el nivel de desarrollo de los niños (factores genéticos, ingesta exacta de alimentos…) no son observables. En segundo lugar, centrar el análisis en el individuo y no en un subgrupo más amplio puede crear problemas de falsos positivos (multiplicidad). 
Por este motivo hemos decidido testear otros enfoques para la identificación causal de efectos heterogéneos más establecidos en la literatura. En particular nos centraremos en la estimación del ATE condicional (CATE) mediante un modelo de Random Decision Tree particular, el Causal Forest. 
En primer lugar, definimos el CATE como:
(…)
Explicación del Causal Forest(…).


###     5.4.	Cálculo de CATE: honest causal forest
## 6.	Resultados
## 7.	Conclusión
## 8.	Bibliografía

