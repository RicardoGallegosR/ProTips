DECLARE
    @ErrorMessage NVARCHAR(4000),
    @ErrorSeverity INT,
    @ErrorState INT

BEGIN TRY
    BEGIN TRANSACTION
        INSERT INTO Examples.Nombres.Nombre (Nombre)
        VALUES	('DESCONOCIDO'), ('AARON'), ('ABELARDO'), ('ABIEL'), ('ABIGAIL'), ('ABRAHAM'), ('ADALID'), ('ADELINA'), ('ADOLFO'), ('ADRIAN'), ('ADRIANA'), ('AGUSTIN'), ('AGUSTINA'), ('AHMED'), ('AIDA'), ('AIDEE'), ('ALAN'), ('ALBA'), ('ALBERTO'), ('ALBINO'), ('ALDO'), ('ALEJANDRA'), ('ALEJANDRINA'), ('ALEJANDRO'), ('ALESSANDRA'), ('ALEXA'), ('ALEXANDER'), ('ALFONSO'), ('ALFREDO'), ('ALICIA'), ('ALINE'), ('ALMA'), ('ALONSO'), ('ALVARO'), ('AMADO'), ('AMANDA'), ('AMARANTA'), ('AMERICA'), ('AMYRA'), ('ANAIS'), ('ANAMELI'), ('ANAYELLI'), ('ANDREA'), ('ANDRES'), ('ANGEL'), ('ANGELA'), ('ANGELICA'), ('ANGELINA'), ('ANIBAL'), ('ANSELMO'), ('ANTONIA'), ('ANTONIO'), ('ARACELI'), ('ARANZAZU'), ('ARCELIA'), ('ARELI'), ('ARELY'), ('ARIANA'), ('ARIANNE'), ('ARISTEO'), ('ARLENE'), ('ARMANDO'), ('ARTURO'), ('ASTRID'), ('ATANACIO'), ('AUGUSTO'), ('AURORA'), ('BARBARA'), ('BEATRIZ'), ('BELEN'), ('BENJAMIN'), ('BERENICE'), ('BERNARDINA'), ('BERNARDO'), ('BRANDON'), ('BRENDA'), ('BRETT'), ('CAMILO'), ('CARLA'), ('CARLOS'), ('CARMELO'), ('CARMEN'), ('CARMINA'), ('CAROLINA'), ('CASSANDRA'), ('CATALINA'), ('CECILIA'), ('CELESTE'), ('CELIA'), ('CESAR'), ('CHRISTIAN'), ('CINDY'), ('CIRINO'), ('CIRO'), ('CITLALI'), ('CITLALLI'), ('CLARA'), ('CLAUDIA'), ('CLAUDIO'), ('CONCEPCION'), ('CONSTANTINO'), ('CONSUELO'), ('CRESCENCIO'), ('CRISTIAN'), ('CRISTINA'), ('CRISTOBAL'), ('CRYSTAL'), ('DACIA'), ('DAFNE'), ('DANIEL'), ('DANIELA'), ('DANIELLE'), ('DANILO'), ('DARIO'), ('DAVID'), ('DEBORAH'), ('DELIA'), ('DENISSE'), ('DENNYS'), ('DIANA'), ('DIEGO'), ('DOLORES'), ('DORIS'), ('DORISOL'), ('DORYSELA'), ('DRUCILA'), ('EDALID'), ('EDGAR'), ('EDITH'), ('EDMUNDO'), ('EDSON'), ('EDUARDO'), ('EFRAIN'), ('ELENA'), ('ELIEL'), ('ELIGIO'), ('ELIO'), ('ELISA'), ('ELISABETH'), ('ELIZABETH'), ('ELKE'), ('ELOISA'), ('ELSA'), ('ELUZAI'), ('ELVIA'), ('ELVIRA'), ('ELY'), ('EMANUEL'), ('EMILIANO'), ('EMILIO'), ('EMMA'), ('EMMANUEL'), ('EMY'), ('ENNA'), ('ENRIQUE'), ('ERANDENI'), ('ERENDIRA'), ('ERIC'), ('ERICK'), ('ERIK'), ('ERIKA'), ('ERNESTO'), ('ESAU'), ('ESMERALDA'), ('ESTEBAN'), ('ESTEFANA'), ('ESTEFANIA'), ('ESTELA'), ('ESTEPHANIE'), ('ESTHELA'), ('ESTHER'), ('EUCLIDES'), ('EUFEMIA'), ('EULOGIO'), ('EVA'), ('EVANGELINA'), ('EVELIA'), ('EVELIN'), ('EVELYN'), ('EVERARDO'), ('EZEQUIEL'), ('FABIO'), ('FABIOLA'), ('FADIA'), ('FANIA'), ('FARIDE'), ('FATIMA'), ('FELIPE'), ('FERNANDA'), ('FERNANDO'), ('FHERNANDA'), ('FIDIAS'), ('FILIBERTO'), ('FLAVIA'), ('FLOR'), ('FLORENTINA'), ('FLORENTINO'), ('FRANCISCA'), ('FRANCISCO'), ('FROYLAN'), ('GABRIEL'), ('GABRIELA'), ('GASPAR'), ('GENOVEVA'), ('GEORGINA'), ('GERARDO'), ('GERMAN'), ('GERTRUDIS'), ('GIANCARLO'), ('GILBERTO'), ('GILDARDO'), ('GIOVANNY'), ('GISELE'), ('GLAFIRA'), ('GLORIA'), ('GRACIELA'), ('GRICELDA'), ('GUADALUPE'), ('GUILLERMO'), ('GUSTAVO'), ('HAIDEE'), ('HECTOR'), ('HEDWIGH'), ('HERIBERTO'), ('HERMILO'), ('HILDA'), ('HOMERO'), ('HORTENCIA'), ('HORTENSIA'), ('HUGO'), ('IFIGENIA'), ('IGNACIO'), ('IKER'), ('ILIANA'), ('ILLIAN'), ('ILLIANA'), ('IMELDA'), ('INDIRA'), ('INES'), ('IRASEMA'), ('IRENE'), ('IRMA'), ('ISAAC'), ('ISABEL'), ('ISAI'), ('ISAIAS'), ('ISELA'), ('ISMAEL'), ('ISRAEL'), ('ITAHI'), ('ITZEL'), ('ITZMALTZIN'), ('IVAN'), ('IVONNE'), ('IVY'), ('JACKELIN'), ('JACOB'), ('JACOBETH'), ('JACQUELINE'), ('JAIME'), ('JANETTE'), ('JAQUELINE'), ('JAVIER'), ('JAZMIN'), ('JEANETTE'), ('JENNIFER'), ('JERONIMO'), ('JESSICA'), ('JESUS'), ('JHOALI'), ('JHOANDY'), ('JHOSELYN'), ('JIMENA'), ('JOAQUIN'), ('JOEL'), ('JONATAN'), ('JONATHAN'), ('JORGE'), ('JOSE'), ('JOSEFA'), ('JOSEFINA'), ('JOSIANNE'), ('JOSIMAR'), ('JOVANNY'), ('JUAN'), ('JUANA'), ('JUDITH'), ('JULIA'), ('JULIAN'), ('JULIETA'), ('JULIO'), ('JUNCIA'), ('KAREN'), ('KARIME'), ('KARINA'), ('KARLA'), ('KATIA'), ('KENIA'), ('KENYA'), ('KRISTIAN'), ('LAURA'), ('LAURO'), ('LEONARDO'), ('LEONOR'), ('LEOPOLDO'), ('LESLY'), ('LETICIA'), ('LILIA'), ('LILIAN'), ('LILIANA'), ('LINET'), ('LITZAHAYA'), ('LIZBETH'), ('LORENA'), ('LORENZO'), ('LOURDES'), ('LUCELBA'), ('LUCIA'), ('LUCILA'), ('LUCIO'), ('LUIS'), ('LYDIA'), ('MABEL'), ('MAETZY'), ('MAGALY'), ('MANUEL'), ('MARCELA'), ('MARCO'), ('MARCOS'), ('MARGARITA'), ('MARIA'), ('MARIANA'), ('MARIANO'), ('MARIBEL'), ('MARICELA'), ('MARICRUZ'), ('MARIEL'), ('MARIELA'), ('MARILU'), ('MARINA'), ('MARIO'), ('MARISELA'), ('MARISOL'), ('MARLENE'), ('MARTHA'), ('MARTIN'), ('MAURICIO'), ('MAXIMO'), ('MAYOMI'), ('MAYRA'), ('MELISA'), ('MELISSA'), ('MERCEDES'), ('MICAELA'), ('MICHAEL'), ('MIGUEL'), ('MIJAIL'), ('MIRELLA'), ('MIREYA'), ('MIRIAM'), ('MODESTO'), ('MOISES'), ('MONICA'), ('MONSERRAT'), ('MONTSERRAT'), ('MYRNA'), ('NAHIM'), ('NALLELY'), ('NANCY'), ('NAYME'), ('NELLY'), ('NICOLAS'), ('NICOLASA'), ('NOEMI'), ('NORBERTO'), ('NORMA'), ('NURY'), ('OCTAVIO'), ('OLGA'), ('OLIVA'), ('OLIVER'), ('OLIVIA'), ('OMAR'), ('OMERO'), ('ORALIA'), ('ORLANDO'), ('OSCAR'), ('OSIRIS'), ('OSVALDO'), ('OSWALDO'), ('PABLO'), ('PALOMA'), ('PAMELA'), ('PAOLA'), ('PATRICIA'), ('PAULINA'), ('PAVEL'), ('PEDRO'), ('PERLA'), ('PIERRE'), ('PILAR'), ('PLACIDO'), ('PORFIRIO'), ('PRISCILA'), ('PUBLIO'), ('QUIRINO'), ('RABINDRANATH'), ('RAFAEL'), ('RAIMUNDO'), ('RAMIRO'), ('RAMON'), ('RAMONA'), ('RAQUEL'), ('RAUL'), ('RAYMUNDO'), ('REBECA'), ('REGINA'), ('RENE'), ('REYNA'), ('RICARDO'), ('RIGOBERTO'), ('ROBERTO'), ('ROCINA'), ('ROCIO'), ('RODOLFO'), ('RODRIGO'), ('ROGELIO'), ('ROLANDO'), ('ROLDAN'), ('ROMAN'), ('ROMEO'), ('ROMINA'), ('ROSALBA'), ('ROSALINDA'), ('ROSARIO'), ('ROSAURA'), ('ROXANA'), ('RUBEN'), ('RUTH'), ('RUXELL'), ('SADRAC'), ('SALUD'), ('SALVADOR'), ('SAMANTHA'), ('SAMUEL'), ('SANDRA'), ('SANTIAGO'), ('SARA'), ('SARAHI'), ('SAYURI'), ('SEBASTIAN'), ('SELENE'), ('SERAFINA'), ('SERGIO'), ('SHANTAL'), ('SIGFREDO'), ('SILVANA'), ('SILVERIA'), ('SILVESTRE'), ('SILVIA'), ('SOFIA'), ('STEPHANIE'), ('SUSANA'), ('TANIA'), ('TATIANA'), ('TEODORA'), ('TERESA'), ('THALIA'), ('TOMAS'), ('UBALDO'), ('ULISES'), ('URSULA'), ('VALENTE'), ('VALENTIN'), ('VALERIA'), ('VANESSA'), ('VERONICA'), ('VIANEY'), ('VICENTE'), ('VICTOR'), ('VICTORIA'), ('VIRGINIA'), ('VIRIDIANA'), ('VLADIMIR'), ('XAVIER'), ('XIMENA'), ('XIOMARA'), ('YADELY'), ('YADIRA'), ('YAMITZI'), ('YANET'), ('YANINE'), ('YAQUELIN'), ('YAZMIN'), ('YENIFFER'), ('YESSENIA'), ('YOLANDA'), ('YOLLOLXOCHITL'), ('YOSELIN'), ('ZARA'), ('ZENAIDA'), ('ZIRAHUEN')
    COMMIT TRANSACTION;
END TRY
BEGIN CATCH
    SELECT 
        @ErrorMessage = ERROR_MESSAGE(),
        @ErrorSeverity = ERROR_SEVERITY(),
        @ErrorState = ERROR_STATE();

        SET @ErrorMessage = 'Error en el procedimiento almacenado Insertar Certificado: ' + @ErrorMessage +
                    '. Error en la línea: ' + CAST(ERROR_LINE() AS NVARCHAR(10))
    RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    ROLLBACK TRANSACTION;
END CATCH


UPDATE Examples.Nombres.Nombre
SET NombreRowguid = '00000000-0000-0000-0000-000000000000'
WHERE NombreId = 0

SELECT * FROM Examples.Nombres.Nombre
