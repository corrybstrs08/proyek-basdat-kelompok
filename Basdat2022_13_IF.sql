---Kelompok 13---
---11S21009 Yose Siagian
---11S21039 Hanny Yosephine 
---11S21047 Corry Betriks Sitorus


--a. Creating and Maintaining Database :---
CREATE DATABASE Akademik;
DROP DATABASE Akademik;

--b. Basic SQL Query : --

--Tabel Mahasiswa--
CREATE TABLE mahasiswa(
	nim VARCHAR(8) NOT NULL,
	nama_mahasiswa VARCHAR(200) NOT NULL,
	tpt_lahir VARCHAR(30),
	tgl_lahir DATE,
	jns_kelamin VARCHAR(10),
	agama VARCHAR(20),
	alamat VARCHAR(100),
	telepon VARCHAR(15),
	email VARCHAR(100),
	semester INT,
	kode_prodi VARCHAR(10),
	PRIMARY KEY (nim),
);
	ALTER TABLE mahasiswa ADD FOREIGN KEY (kode_prodi) REFERENCES prodi;

SELECT * FROM mahasiswa;

INSERT INTO mahasiswa (nim, nama_mahasiswa, tpt_lahir, tgl_lahir, jns_kelamin, 
			agama, alamat, telepon, email, semester, kode_prodi)
VALUES  ('11S21009', 'Yose Siagian', 'Balige', '2003-03-30', 'Laki-laki', 'Kristen', 
		'Balige', '082297360943', 'yosesiagian30@gmail.com', '3', '11S'),
		('11S21039', 'Hanny Yosephine', 'Medan', '2004-03-16', 'Perempuan', 'Kristen', 
		'Medan', '082115252345', 'hannyyoshepine00@gmail.com', '3', '11S'),
		('11S21047', 'Corry Sitorus', 'Raut Bosi', '2003-04-08', 'Perempuan', 'Kristen', 
		'Porsea', '081268745513', 'corrysitorus03@gmail.com', '3', '11S'),
		('12S21048', 'Nessy Pangaribuan', 'Laguboti', '2003-06-24', 'Perempuan', 'Kristen', 
		'Laguboti', '082245126754', 'nessypangaribuan8@gmail.com', '3', '12S'),
		('13321006', 'Jefta Manurung', 'Uluan', '2003-06-15', 'Laki-laki', 'Kristen', 
		'Uluan', '082267543346', 'jeftamanurung09@gmail.com', '3', '133'),
		('11322046', 'Indah SItorus', 'Porsea', '2004-12-25', 'Perempuan', 'Kristen', 
		'Porsea', '082145328916', 'indahsitorus77@gmail.com', '1', '113'),
		('21S22045', 'Jelita Debora', 'Uluan', '2004-05-23', 'Perempuan', 'Kristen', 
		'Uluan', '087756439812', 'jelitadebora54@gmail.com', '1', '21S'),
		('31S21003', 'Zefanya Hutapea', 'Siborong-borong', '2003-06-16', 'Perempuan', 'Kristen', 
		'Siborong-borong', '087734591234', 'zefanyahutapea98@gmail.con', '3', '31S'),
		('11420057', 'Tahnia', 'Porsea', '2002-03-24', 'Perempuan', 'Islam', 
		'Porsea', '085234519781', 'tahnia34@gmail.com', '5', '114'),
		('14S19009', 'Herlanto Sitompul', 'Porsea', '2001-11-28', 'Laki-laki', 'Kristen', 
		'Porsea', '082279671341', 'herlantositompul9@gmail.com', '7', '14S');
SELECT	nim AS NIM, nama_mahasiswa AS NamaMahasiswa, tpt_lahir AS TempatLahir, 
		jns_kelamin AS JenisKelamin, agama AS Agama, alamat AS Alamat, telepon AS Telepon,	
		email AS Email, semester AS Semester, kode_prodi AS KodeProdi
FROM mahasiswa;

DROP TABLE mahasiswa;


--Tabel Matakuliah--
CREATE TABLE mata_kuliah(
	kode_mk VARCHAR(10) NOT NULL,
	nama_mk VARCHAR(100),
	semester INT,
	sks INT,
	PRIMARY KEY (kode_mk)
);
SELECT * FROM mata_kuliah;

INSERT INTO mata_kuliah (kode_mk, nama_mk, semester, sks)
VALUES	('KUS1102', 'Pembentukan Karakter Del', '1', '2'),
		('11S2113', 'Rekayasa Perangkat Lunak', '2', '3'),
		('11S3204', 'Keamanan Perangkat Lunak', '6', '3'),
		('11S4028', 'Rekayasa Perangkat Lunak Berbasis Komponen', '7', '4'),
		('12S2102', 'Basis Data', '3', '4'),
		('11S3109', 'Pengembangan Aplikasi Berbasis Web', '5', '4'),
		('10S2202', 'Jaringan Komputer', '4', '3'),
		('11S4030', 'UI/UX Design', '8', '3');
SELECT kode_mk AS KodeMataKuliah, nama_mk AS NamaMataKuliah, semester AS Semester, sks AS SKS
FROM mata_kuliah;

DROP TABLE mata_kuliah;


--Tabel Data Kuliah--
CREATE TABLE data_kuliah(
	nim VARCHAR (8), 
	kode_mk VARCHAR(10),
	semester INT
);
	ALTER TABLE data_kuliah ADD FOREIGN KEY (nim) REFERENCES mahasiswa;
	ALTER TABLE data_kuliah ADD FOREIGN KEY (kode_mk) REFERENCES mata_kuliah;
SELECT * FROM data_kuliah;

INSERT INTO data_kuliah (nim, kode_mk, semester)
VALUES	('11S21047', '12S2102', '3'),
		('11S21039', '12S2102', '3'),
		('21S22045', 'KUS1102', '1'),
		('12S21048', '12S2102', '3'),
		('11322046', 'KUS1102', '1'),
		('14S19009', '114028', '7'),
		('11420057', '11S3109', '5');
SELECT nim AS NIM, kode_mk AS KodeMataKuliah, semester AS Semester
FROM data_kuliah;

DROP TABLE data_kuliah;


--Tabel Prodi--
CREATE TABLE prodi(
	kode_prodi VARCHAR(10) NOT NULL,
	nama_prodi VARCHAR(50),
	PRIMARY KEY (kode_prodi)
);
SELECT * FROM prodi;

INSERT INTO prodi(kode_prodi, nama_prodi)
VALUES  ('113', 'Teknologi Informasi'),
		('114', 'Teknologi Rekayasa Perangkat Lunak'),
		('133', 'Teknologi Komputer'), 
		('11S', 'Informatika'),
		('12S', 'Sistem Informasi'),
		('14S', 'Teknik Elektro'),
		('21S', 'Manajemen Rekayasa'),
		('31S', 'Teknik Bioproses');
SELECT kode_prodi AS KodeProdi, nama_prodi AS NamaProdi
FROM prodi;

DROP TABLE prodi;


--Tabel Dosen--
CREATE TABLE dosen(
	nid VARCHAR(10) NOT NULL,
	kode_prodi VARCHAR(10) NOT NULL, 
	nama_dosen VARCHAR(100),
	telepon VARCHAR (15),
	email VARCHAR(100),
	alamat VARCHAR(100),
	PRIMARY KEY (nid)
);
	ALTER TABLE dosen ADD FOREIGN KEY (kode_prodi) REFERENCES prodi;
SELECT * FROM dosen;

INSERT INTO dosen (nid, kode_prodi, nama_dosen, telepon, email, alamat)
VALUES	('012408201', '12S', 'Rosni Lumbantoruan,Ph.D.', '081265982378', 'Laguboti', 'rosnilumbantoruan44@gmail.com'),
		('0114017901', '14S', 'Deni Parlindungan Lumbantoruan , ST, M.Eng', '085762359178', 'Balige', 'denitoruan09@gmail.com'),
		('0109108702', '31S', 'Adrianto Prihartantyo, S.Si., M.T.', '085289561245', 'Malang', 'adrianto98@gmail.com'),
		('0114129002', '11S', 'Iustisia Natalia Simbolon, S.Kom., M.T.', '081269124634', 'Jakarta', 'iustisiasimbolon33@gmail.com'),
		('0115017701', '114', 'Dr. Arnaldo Marulitua Sinaga, ST., M.InfoTech.', '081364895112', 'Balige', 'arnaldosinaga34@gmail.com'),
		('0130068601', '21S', 'Devis Wawan Saputra, ST., MBA.', '081398422231', 'Denpasar', 'deviswawan51@gmail.com'),
		('0104088902', '133', 'Istas Manalu, S.Si., M.Sc', '087894532167', 'Samosir', 'istasmanalu76@gmail.com'),
		('0124098904', '113', 'Hernawati Susanti Samosir, SST., M.Kom.', '082167432214', 'Tarutung', 'hernawatisamosir21@gmail.com');
SELECT nid AS NID, kode_prodi AS KodeProdi, nama_dosen AS NamaDosen, telepon AS Telepon, email AS Email, alamat AS Alamat
FROM dosen;

DROP TABLE dosen;


--Tabel Jadwal--
CREATE TABLE jadwal(
	kode_ruangan INT,
	kode_mk VARCHAR(10),
	nid VARCHAR(10),
	hari varchar (10),
	waktu VARCHAR (25),
);
	ALTER TABLE jadwal ADD FOREIGN KEY (kode_ruangan) REFERENCES ruangan;
	ALTER TABLE jadwal ADD FOREIGN KEY (kode_mk) REFERENCES mata_kuliah;
	ALTER TABLE jadwal ADD FOREIGN KEY (nid) REFERENCES dosen;
SELECT * FROM jadwal;

INSERT INTO jadwal(kode_ruangan, kode_mk, nid, hari, waktu)
VALUES	(721, '12S2102', '0114129002', 'Senin', '13.00 - 15.00'),
		(943, 'KUS1102', '0109108702', 'Selasa', '08.00 - 10.00'),
		(722, '11S3109', '0115017701', 'Rabu', '10.00 - 12.00'),
		(723, '11S4028', '0114017901', 'Kamis', '15.00 - 17.00'),
		(928, '12S2102', '0114129002', 'Jumat', '08.00 - 10.00'),
		(714, '11S4028', '0114017901', 'Kamis', '15.00 - 17.00'),
		(516, 'KUS1102', '0109108702', 'Rabu', '13.00 - 15.00'),
		(938, '11S3109', '0115017701', 'Jumat', '13.00 - 15.00');
SELECT kode_ruangan AS KodeRuangan, kode_mk AS KodeMataKuliah, nid AS NID, hari AS Hari, waktu AS Waktu
FROM jadwal;

DROP TABLE jadwal;

--Tabel Ruangan--
CREATE TABLE ruangan(
	kode_ruangan INT NOT NULL,
	nama_ruangan VARCHAR(10),
	kapasitas VARCHAR(100),
	PRIMARY KEY (kode_ruangan)
);

SELECT * FROM ruangan;

INSERT INTO ruangan(kode_ruangan, nama_ruangan, kapasitas)
VALUES	('516', 'GD 516', '65'),
		('714', 'GD 714', '80'),
		('721', 'GD 721', '80'),
		('722', 'GD 722', '90'),
		('723', 'GD 723', '80'),
		('724', 'GD 724', '50'),
		('928', 'GD 928', '60'),
		('937', 'GD 937', '60'),
		('938', 'GD 938', '75'),
		('943', 'GD 943', '70');
SELECT kode_ruangan AS KodeRuangan, nama_ruangan AS NamaRuangan, kapasitas AS Kapasitas
FROM ruangan;

DROP TABLE ruangan;


--Tabel Nilai--
CREATE TABLE nilai(
	nim VARCHAR(8),
	kode_mk VARCHAR(10),
	tugas  INT,
	uts  INT,
	uas  INT,
	kuis  INT,
	prak  INT,
	total_nilai  DECIMAL (3,1)
);
	ALTER TABLE nilai ADD FOREIGN KEY (nim) REFERENCES mahasiswa;
	ALTER TABLE nilai ADD FOREIGN KEY (kode_mk) REFERENCES mata_kuliah;
SELECT * FROM nilai;

INSERT INTO nilai(nim, kode_mk, tugas, uts, uas, kuis, prak, total_nilai)
VALUES	('11S21009', '12S2102', '90', '80', '84', '83', '89', '85.2'),
		('11S21039', '12S2102', '95', '87', '93', '87', '94', '91.2'),
		('11S21047', '12S2102', '94', '85', '90', '87', '94', '90.0'),
		('21S22045', 'KUS1102', '90', '89', '90', '90', '89', '89.6'),
		('12S21048', '12S2102', '92', '86', '85', '89', '92', '88.8'),
		('11322046', 'KUS1102', '93', '81', '82', '86', '90', '86.5'),
		('11420057', '11S3109', '95', '80', '84', '85', '87', '86.2'),
		('14S19009', '11S4028', '97', '89', '82', '94', '86', '89.6');
SELECT	nim AS NIM, kode_mk AS KodeMataKuliah, tugas AS Tugas, uts AS UTS, 
		uas AS UAS, kuis AS Kuis, prak AS Praktikum, total_nilai AS TotalNilai
FROM nilai;

DROP TABLE nilai;


--Tabel Penilaian--
CREATE TABLE penilaian(
	nim VARCHAR(8),
	kode_mk VARCHAR(10),
	total_nilai DECIMAL (3,1)
);
	ALTER TABLE penilaian ADD FOREIGN KEY (nim) REFERENCES mahasiswa;
	ALTER TABLE penilaian ADD FOREIGN KEY (kode_mk) REFERENCES mata_kuliah;
SELECT * FROM penilaian;

INSERT INTO penilaian(nim, kode_mk, total_nilai)
VALUES	('11S21009', '12S2102', '85.2'),
		('11S21039', '12S2102', '91.2'),
		('11S21047', '12S2102', '90.0'),
		('21S22045', 'KUS1102', '89.6'),
		('12S21048', '12S2102', '88.8'),
		('11322046', 'KUS1102', '86.5'),
		('11420057', '11S3109', '86.2'),
		('14S19009', '11S4028', '89.6');
SELECT nim AS NIM, kode_mk AS KodeMataKuliah, total_nilai AS TotalNilai
FROM penilaian;

DROP TABLE penilaian;


--UPDATE TABLE--
	UPDATE ruangan SET kapasitas = 70
	WHERE kode_ruangan = 516;

	SELECT * FROM ruangan;

	UPDATE ruangan SET kapasitas = 100
	WHERE kode_ruangan = 722;

	SELECT * FROM ruangan;

	UPDATE ruangan SET kapasitas = 80
	WHERE kode_ruangan = 724;

	SELECT * FROM ruangan;

	UPDATE ruangan SET kapasitas = 65
	WHERE kode_ruangan = 928;

	SELECT * FROM ruangan;

--DELETE TABLE--
	DELETE FROM mahasiswa
	WHERE nim = '11S21047';

	SELECT * FROM mahasiswa;

--Menampilkan Mahasiswa sesuai prodi tertentu--
--Kode Prodi Informatika--
SELECT nim, nama_mahasiswa, kode_prodi
FROM mahasiswa
WHERE kode_prodi = '11S'

--Kode Prodi Sistem Informasi--
SELECT nim, nama_mahasiswa, kode_prodi
FROM mahasiswa
WHERE kode_prodi = '12S'

--Kode Prodi Teknik Bioproses--
SELECT nim, nama_mahasiswa, kode_prodi
FROM mahasiswa
WHERE kode_prodi = '31S'


--Menampilkan dosen dengan kode prodi---
--Dosen Teknologi Informasi--
SELECT nid, nama_dosen
FROM dosen
WHERE kode_prodi = '113'

--Teknologi Komputer--
SELECT nid, nama_dosen
FROM dosen
WHERE kode_prodi = '133'

--Dosen Teknologi Rekayasa Perangkat Lunak--
SELECT nid, nama_dosen
FROM dosen
WHERE kode_prodi = '114'

--Menampilkan nama mahasiswa beserta NIM--
SELECT nim, nama_mahasiswa
FROM mahasiswa


--Menggunakan Operator SELECT FROM GROUP BY HAVING ORDER BY & aggregate function--
SELECT nim, SUM(total_nilai)
FROM penilaian
GROUP BY nim
HAVING SUM(total_nilai)>89
ORDER BY SUM(total_nilai);


--Operators: Comparison Operators--
SELECT nim AS NIM, kode_mk AS KodeMataKuliah, total_nilai AS TotalNilai
FROM penilaian
WHERE total_nilai BETWEEN 90 AND 95;

SELECT nim, nama_mahasiswa, semester
FROM mahasiswa
WHERE semester LIKE '3';


--null value--
SELECT nim, nama_mahasiswa, telepon, email
FROM mahasiswa
WHERE telepon IS NULL


--CREATE VIEW TABLE--
--TABLE MAHASISWA--
USE Akademik
GO
CREATE VIEW mahasiswaView
AS 
SELECT nama_mahasiswa, telepon, email, semester, kode_prodi
FROM mahasiswa;

SELECT *FROM mahasiswaView

--DROP VIEW mahasiswaView

--Tabel MataKuliah--
USE Akademik
GO
CREATE VIEW matakuliahView
AS 
SELECT kode_mk, nama_mk
FROM mata_kuliah;

SELECT *FROM matakuliahView

--Tabel Data Kuliah--
USE Akademik
GO
CREATE VIEW datakuliahView
AS
SELECT nim, kode_mk
FROM data_kuliah;

SELECT *FROM datakuliahView

--Tabel Prodi-- 
USE Akademik
GO
CREATE VIEW prodiView
AS
SELECT kode_prodi, nama_prodi
FROM prodi;

SELECT *FROM prodiView

--Tabel Dosen--
USE Akademik
GO
CREATE VIEW dosenView
AS
SELECT nid, nama_dosen, telepon, email
FROM dosen;

SELECT *FROM dosenView

--Tabel Jadwal--
USE Akademik
GO
CREATE VIEW jadwalView
AS
SELECT kode_ruangan, kode_mk, nid, hari, waktu
FROM jadwal;

SELECT *FROM jadwalView

--Tabel Ruangan--
USE Akademik
GO
CREATE VIEW ruanganView
AS
SELECT kode_ruangan, nama_ruangan
FROM ruangan;

SELECT *FROM ruanganView

--Tabel nilai--
USE Akademik
GO
CREATE VIEW nilaiView
AS
SELECT nim, kode_mk, tugas, uts, uas, kuis, prak
FROM nilai;

SELECT *FROM nilaiView

--Tabel Penilaian--
USE Akademik
GO
CREATE VIEW penilaianView
AS
SELECT nim, kode_mk, total_nilai
FROM penilaian;

SELECT *FROM penilaianView


--Querying Multiple Tables--
--INNER JOIN--
USE Akademik
SELECT nama_mahasiswa, penilaian.nim, total_nilai
FROM mahasiswa INNER JOIN penilaian
ON mahasiswa.nim = penilaian.nim

--LEFT OUTER JOIN--
USE Akademik
SELECT nama_mahasiswa, penilaian.nim, total_nilai
FROM mahasiswa LEFT OUTER JOIN penilaian
ON mahasiswa.nim = penilaian.nim

--CROSS JOIN--
SELECT nama_mahasiswa, total_nilai
FROM mahasiswa CROSS JOIN penilaian

--UNION--
SELECT nama_mahasiswa, kode_prodi
FROM mahasiswa
UNION 
SELECT nama_prodi, kode_prodi
FROM prodi

--STORED PROCEDURE--
USE Akademik
CREATE PROCEDURE selectMahasiswa
AS
    SELECT nim, nama_mahasiswa FROM mahasiswa
	WHERE jns_kelamin = 'Perempuan'

EXECUTE  selectMahasiswa
GO

USE Akademik
CREATE PROCEDURE selectDosen
AS 
	SELECT nid, nama_dosen, telepon FROM dosen
	WHERE kode_prodi = '11S'

EXECUTE selectDosen
GO

DROP TABLE mahasiswa;
DROP TABLE mata_kuliah;
DROP TABLE data_kuliah;
DROP TABLE prodi;
DROP TABLE dosen;
DROP TABLE jadwal;
DROP TABLE ruangan;
DROP TABLE nilai;
DROP TABLE penilaian;

