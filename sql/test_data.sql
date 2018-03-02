USE Chrono;
TRUNCATE T_Marques;
INSERT INTO T_Marques VALUES( NULL,"TM Racing");
INSERT INTO T_Marques VALUES( NULL,"Evoset");
INSERT INTO T_Marques VALUES( NULL,"Honda");
INSERT INTO T_Marques VALUES( NULL,"Yamaha");
INSERT INTO T_Marques VALUES( NULL,"Kawasaki");
INSERT INTO T_Marques VALUES( NULL,"Suzuki");
INSERT INTO T_Marques VALUES( NULL,"KTM");
INSERT INTO T_Marques VALUES( NULL,"Sherco");
INSERT INTO T_Marques VALUES( NULL,"GasGas");
INSERT INTO T_Marques VALUES( NULL,"Husaberg");
INSERT INTO T_Marques VALUES( NULL,"Maico");
INSERT INTO T_Marques VALUES( NULL,"Beta");
INSERT INTO T_Marques VALUES( NULL,"Aprilia");
INSERT INTO T_Marques VALUES( NULL,"Montesa");
INSERT INTO T_Marques VALUES( 65535,"Non definit");

TRUNCATE T_Concurents;
INSERT INTO T_Concurrents (numero,nom,prenom,ville,moto) VALUES(66,'SCHAFER',"Alain","Fribourg",(SELECT id FROM T_Marques WHERE nom LIKE "Honda"));
INSERT INTO T_Concurrents (numero,nom,prenom,ville,moto) VALUES(906,"CORTIJO","Yohan","Illarsaz",(SELECT id FROM T_Marques WHERE nom LIKE "Yamaha"));
INSERT INTO T_Concurrents (numero,nom,prenom,ville,moto) VALUES(28,"POGET","Elies","Echandens",(SELECT id FROM T_Marques WHERE nom LIKE "KTM"));
INSERT INTO T_Concurrents (numero,nom,prenom,ville,moto) VALUES(718,"YERLY","Cedric","Treyvaux",(SELECT id FROM T_Marques WHERE nom LIKE "Kawasaki"));
INSERT INTO T_Concurrents (numero,nom,prenom,ville,moto) VALUES(819,"WENGER","Marc","Alterswil",(SELECT id FROM T_Marques WHERE nom LIKE "Husqvarna"));
INSERT INTO T_Concurrents (numero,nom,prenom,ville,moto) VALUES(3,"PEISSARD","Patrick","Matran",(SELECT id FROM T_Marques WHERE nom LIKE "Kawasaki"));
INSERT INTO T_Concurrents (numero,nom,prenom,ville,moto) VALUES(108,"FAHRNI","Normand","Broc",(SELECT id FROM T_Marques WHERE nom LIKE "Suzuki"));
INSERT INTO T_Concurrents (numero,nom,prenom,ville,moto) VALUES(15,"SIMOND","Baptiste","Lovatens",(SELECT id FROM T_Marques WHERE nom LIKE "Honda"));
INSERT INTO T_Concurrents (numero,nom,prenom,ville,moto) VALUES(100,"SCHAFER","Samuel","Giffers",(SELECT id FROM T_Marques WHERE nom LIKE "Honda"));
INSERT INTO T_Concurrents (numero,nom,prenom,ville,moto) VALUES(94,"AEBERSOLD","Remo","Bleiken",(SELECT id FROM T_Marques WHERE nom LIKE "Yamaha"));
INSERT INTO T_Concurrents (numero,nom,prenom,ville,moto) VALUES(11,"FRACHEBOUD","Louis","Puidoux",(SELECT id FROM T_Marques WHERE nom LIKE "Yamaha"));
INSERT INTO T_Concurrents (numero,nom,prenom,ville,moto) VALUES(222,"BRODARD","Olivier","Posieux",(SELECT id FROM T_Marques WHERE nom LIKE "Honda"));
INSERT INTO T_Concurrents (numero,nom,prenom,ville,moto) VALUES(49,"COUTAZ","Sebastien","Genolier",(SELECT id FROM T_Marques WHERE nom LIKE "KTM"));
INSERT INTO T_Concurrents (numero,nom,prenom,ville,moto) VALUES(12,"SCHUPBACH","Valentin","Arconciel",(SELECT id FROM T_Marques WHERE nom LIKE "Kawasaki"));
INSERT INTO T_Concurrents (numero,nom,prenom,ville,moto) VALUES(221,"HINNI","Joel","Zollikofen",(SELECT id FROM T_Marques WHERE nom LIKE "Yamaha"));
INSERT INTO T_Concurrents (numero,nom,prenom,ville,moto) VALUES(932,"SALLIN","Junior","Belfaux",(SELECT id FROM T_Marques WHERE nom LIKE "Kawasaki"));
INSERT INTO T_Concurrents (numero,nom,prenom,ville,moto) VALUES(17,"DA VEIGA","Diego","Vendlincourt",(SELECT id FROM T_Marques WHERE nom LIKE "KTM"));
INSERT INTO T_Concurrents (numero,nom,prenom,ville,moto) VALUES(892,"KILCHOER","Loec","La Roche",(SELECT id FROM T_Marques WHERE nom LIKE "KTM"));
INSERT INTO T_Concurrents (numero,nom,prenom,ville,moto) VALUES(907,"SALLIN","Louis","Belfaux",(SELECT id FROM T_Marques WHERE nom LIKE "KTM"));
INSERT INTO T_Concurrents (numero,nom,prenom,ville,moto) VALUES(32,"SCHUPBACH","David","Arconciel",(SELECT id FROM T_Marques WHERE nom LIKE "Kawasaki"));
INSERT INTO T_Concurrents (numero,nom,prenom,ville,moto) VALUES(2,"GUISOLAN","Sven","Noreaz",(SELECT id FROM T_Marques WHERE nom LIKE "TM Racing"));
INSERT INTO T_Concurrents (numero,nom,prenom,ville,moto) VALUES(59,"CHAUTEMS","Remy","Chene-Paquier",(SELECT id FROM T_Marques WHERE nom LIKE "Suzuki"));
INSERT INTO T_Concurrents (numero,nom,prenom,ville,moto) VALUES(421,"WAEBER","Mathieu","Ecuvillens",(SELECT id FROM T_Marques WHERE nom LIKE "Yamaha"));
INSERT INTO T_Concurrents (numero,nom,prenom,ville,moto) VALUES(129,"ZUGER","Neal","Cressier",(SELECT id FROM T_Marques WHERE nom LIKE "KTM"));
