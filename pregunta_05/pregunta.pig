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


data1 = LOAD 'data.tsv'
        AS(col1:CHARARRAY,
        tuples:BAG{},
        col3:MAP[]);

letras = FOREACH data1 GENERATE FLATTEN(tuples) AS letra;

grouped = GROUP letras BY letra;

letracount = FOREACH grouped GENERATE group, COUNT(letras);

STORE letracount INTO 'output' USING PigStorage(',');