/*
Pregunta
===========================================================================

Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
aparece cada letra minúscula en la columna 2.

Escriba el resultado a la carpeta `output` del directorio actual. Para la 
evaluación, pig sera eejcutado ejecutado en modo local:

$ pig -x local -f pregunta.pig

        >>> Escriba su respuesta a partir de este punto <<<
*/

u = LOAD 'data.tsv' USING PigStorage('\t')
        AS(col1:CHARARRAY,
        col2:BAG{},
        col3:MAP[]);

y = FOREACH u GENERATE FLATTEN(col2) AS letra:CHARARRAY;
grupo = GROUP y BY letra;
z = FOREACH grupo GENERATE group, COUNT(y.letra);
STORE z INTO 'output' USING PigStorage(',');