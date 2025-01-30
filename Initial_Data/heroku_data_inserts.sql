--
-- PostgreSQL database dump
--

-- Dumped from database version 16.4
-- Dumped by pg_dump version 16.6 (Ubuntu 16.6-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: prefecture
--

INSERT INTO public.prefecture (id) VALUES (1);
INSERT INTO public.prefecture (id) VALUES (2);
INSERT INTO public.prefecture (id) VALUES (3);
INSERT INTO public.prefecture (id) VALUES (4);


--
-- Data for Name: area
--

INSERT INTO public.area (id, prefecture_id) VALUES (1, 1);
INSERT INTO public.area (id, prefecture_id) VALUES (2, 1);
INSERT INTO public.area (id, prefecture_id) VALUES (3, 1);
INSERT INTO public.area (id, prefecture_id) VALUES (4, 1);
INSERT INTO public.area (id, prefecture_id) VALUES (5, 1);
INSERT INTO public.area (id, prefecture_id) VALUES (6, 1);
INSERT INTO public.area (id, prefecture_id) VALUES (7, 1);
INSERT INTO public.area (id, prefecture_id) VALUES (8, 2);
INSERT INTO public.area (id, prefecture_id) VALUES (9, 2);
INSERT INTO public.area (id, prefecture_id) VALUES (10, 2);
INSERT INTO public.area (id, prefecture_id) VALUES (11, 2);
INSERT INTO public.area (id, prefecture_id) VALUES (12, 2);
INSERT INTO public.area (id, prefecture_id) VALUES (13, 2);
INSERT INTO public.area (id, prefecture_id) VALUES (14, 3);
INSERT INTO public.area (id, prefecture_id) VALUES (15, 3);
INSERT INTO public.area (id, prefecture_id) VALUES (16, 3);
INSERT INTO public.area (id, prefecture_id) VALUES (17, 4);
INSERT INTO public.area (id, prefecture_id) VALUES (18, 4);
INSERT INTO public.area (id, prefecture_id) VALUES (19, 4);
INSERT INTO public.area (id, prefecture_id) VALUES (20, 4);


--
-- Data for Name: language
--

INSERT INTO public.language (id, name, code) VALUES (1, 'English', 'en');
INSERT INTO public.language (id, name, code) VALUES (2, 'Greek', 'el');


--
-- Data for Name: area_name
--

INSERT INTO public.area_name (id, prefecture_id, area_id, language_id, name) VALUES (1, 1, 1, 1, 'Peza, Kounavoi, Myrtia, Kalloni, Agies Paraskies');
INSERT INTO public.area_name (id, prefecture_id, area_id, language_id, name) VALUES (2, 1, 2, 1, 'Moires, Petrokefali, Pompia, Alithini, Kouses, Peri, Kasteli');
INSERT INTO public.area_name (id, prefecture_id, area_id, language_id, name) VALUES (3, 1, 3, 1, 'Pyrgos, Harakas, Asimi');
INSERT INTO public.area_name (id, prefecture_id, area_id, language_id, name) VALUES (4, 1, 4, 1, 'Malia');
INSERT INTO public.area_name (id, prefecture_id, area_id, language_id, name) VALUES (5, 1, 5, 1, 'Arkalochori, Thrapsano, Kasteli');
INSERT INTO public.area_name (id, prefecture_id, area_id, language_id, name) VALUES (6, 1, 6, 1, 'Potamies');
INSERT INTO public.area_name (id, prefecture_id, area_id, language_id, name) VALUES (7, 1, 7, 1, 'D.E. Krousona');
INSERT INTO public.area_name (id, prefecture_id, area_id, language_id, name) VALUES (8, 1, 1, 2, 'Πεζά, Κουνάβοι, Μυρτιά, Καλλονή, Αγιές Παρασκιές');
INSERT INTO public.area_name (id, prefecture_id, area_id, language_id, name) VALUES (9, 1, 2, 2, 'Μοίρες, Πετροκεφάλι, Πόμπια, Αληθινή, Κουσές, Περί, Καστέλι');
INSERT INTO public.area_name (id, prefecture_id, area_id, language_id, name) VALUES (10, 1, 3, 2, 'Πύργος, Χάρακας, Ασήμι');
INSERT INTO public.area_name (id, prefecture_id, area_id, language_id, name) VALUES (11, 1, 4, 2, 'Μάλια');
INSERT INTO public.area_name (id, prefecture_id, area_id, language_id, name) VALUES (12, 1, 5, 2, 'Αρκαλοχώρι, Θραψανό, Καστέλλι');
INSERT INTO public.area_name (id, prefecture_id, area_id, language_id, name) VALUES (13, 1, 6, 2, 'Ποταμιές');
INSERT INTO public.area_name (id, prefecture_id, area_id, language_id, name) VALUES (14, 1, 7, 2, 'Δ.Ε. Κρουσώνα');
INSERT INTO public.area_name (id, prefecture_id, area_id, language_id, name) VALUES (15, 2, 8, 1, 'Alikianos, Agia');
INSERT INTO public.area_name (id, prefecture_id, area_id, language_id, name) VALUES (16, 2, 9, 1, 'Voukolies, Tavronitis');
INSERT INTO public.area_name (id, prefecture_id, area_id, language_id, name) VALUES (17, 2, 10, 1, 'Kolympari');
INSERT INTO public.area_name (id, prefecture_id, area_id, language_id, name) VALUES (18, 2, 11, 1, 'Vryses Apokoronou');
INSERT INTO public.area_name (id, prefecture_id, area_id, language_id, name) VALUES (19, 2, 12, 1, 'Kolpos Kissamou, Kasteli');
INSERT INTO public.area_name (id, prefecture_id, area_id, language_id, name) VALUES (20, 2, 13, 1, 'Falasarna');
INSERT INTO public.area_name (id, prefecture_id, area_id, language_id, name) VALUES (21, 2, 8, 2, 'Αλικιανός, Αγιά');
INSERT INTO public.area_name (id, prefecture_id, area_id, language_id, name) VALUES (22, 2, 9, 2, 'Βουκολιές, Ταυρωνίτης');
INSERT INTO public.area_name (id, prefecture_id, area_id, language_id, name) VALUES (23, 2, 10, 2, 'Κολυμπάρι');
INSERT INTO public.area_name (id, prefecture_id, area_id, language_id, name) VALUES (24, 2, 11, 2, 'Βρύσες Αποκορώνου');
INSERT INTO public.area_name (id, prefecture_id, area_id, language_id, name) VALUES (25, 2, 12, 2, 'Κόλπος Κισσάμου, Καστέλι');
INSERT INTO public.area_name (id, prefecture_id, area_id, language_id, name) VALUES (26, 2, 13, 2, 'Φαλάσαρνα');
INSERT INTO public.area_name (id, prefecture_id, area_id, language_id, name) VALUES (27, 3, 14, 1, 'Chamalevriou, Pangalochoriou, Pigis, Adele, Angeliana');
INSERT INTO public.area_name (id, prefecture_id, area_id, language_id, name) VALUES (28, 3, 15, 1, 'Episkopi');
INSERT INTO public.area_name (id, prefecture_id, area_id, language_id, name) VALUES (29, 3, 16, 1, 'Plakias');
INSERT INTO public.area_name (id, prefecture_id, area_id, language_id, name) VALUES (30, 3, 14, 2, 'Χαμαλευρίου, Παγκαλοχωρίου, Πηγής, Άδελε, Αγγελιανά');
INSERT INTO public.area_name (id, prefecture_id, area_id, language_id, name) VALUES (31, 3, 15, 2, 'Επισκοπή');
INSERT INTO public.area_name (id, prefecture_id, area_id, language_id, name) VALUES (32, 3, 16, 2, 'Πλακιάς');
INSERT INTO public.area_name (id, prefecture_id, area_id, language_id, name) VALUES (33, 4, 17, 1, 'Siteias, Piskokefalou');
INSERT INTO public.area_name (id, prefecture_id, area_id, language_id, name) VALUES (34, 4, 18, 1, 'Milatos, Sisi');
INSERT INTO public.area_name (id, prefecture_id, area_id, language_id, name) VALUES (35, 4, 19, 1, 'Ierapetra');
INSERT INTO public.area_name (id, prefecture_id, area_id, language_id, name) VALUES (36, 4, 20, 1, 'Merambelou');
INSERT INTO public.area_name (id, prefecture_id, area_id, language_id, name) VALUES (37, 4, 17, 2, 'Σητείας, Πισκοκεφάλου');
INSERT INTO public.area_name (id, prefecture_id, area_id, language_id, name) VALUES (38, 4, 18, 2, 'Μίλατος, Σίσι');
INSERT INTO public.area_name (id, prefecture_id, area_id, language_id, name) VALUES (39, 4, 19, 2, 'Ιεράπετρα');
INSERT INTO public.area_name (id, prefecture_id, area_id, language_id, name) VALUES (40, 4, 20, 2, 'Μεραμβέλου');


--
-- Data for Name: crop_type
--

INSERT INTO public.crop_type (id) VALUES (1);
INSERT INTO public.crop_type (id) VALUES (2);
INSERT INTO public.crop_type (id) VALUES (3);
INSERT INTO public.crop_type (id) VALUES (4);
INSERT INTO public.crop_type (id) VALUES (5);
INSERT INTO public.crop_type (id) VALUES (6);


--
-- Data for Name: soil_type
--

INSERT INTO public.soil_type (id) VALUES (1);
INSERT INTO public.soil_type (id) VALUES (2);
INSERT INTO public.soil_type (id) VALUES (3);


--
-- Data for Name: user
--

INSERT INTO public."user" (id, username, email, profile_image, password) VALUES (1, 'grigoris', 'mtp329@edu.hmu.gr', 'default_profile_image.png', '$2b$12$t3ODmvNTLMDtSM0cThQg6OUJlI0S2K0qw4CwqLSUeoe5J34FMD6K6');
INSERT INTO public."user" (id, username, email, profile_image, password) VALUES (2, 'NikosMouzakitis', 'mzktsn@gmail.com', 'default_profile_image.png', '$2b$12$qDQfKLq2jkKn657CbsKAZehO1D6DZO/OcAgfL2xKTrybemrRRgngK');


--
-- Data for Name: crop
--

INSERT INTO public.crop (id, name, location, prefecture, area, crop_size, crop_type, soil_type, image, user_id) VALUES (1, 'Λιόφυτο Βρύση', 'Λαγκάδα', 1, 3, 2.8, 1, 2, 'default_crop_image.png', 1);

--
-- Data for Name: crop_coordinates
--

INSERT INTO public.crop_coordinates (id, crop_id, longtitute, latitude) VALUES (1, 1, 35.2679287234295, 25.1909972646561);
INSERT INTO public.crop_coordinates (id, crop_id, longtitute, latitude) VALUES (2, 1, 35.2679950759142, 25.1910905730714);
INSERT INTO public.crop_coordinates (id, crop_id, longtitute, latitude) VALUES (3, 1, 35.2680548889663, 25.1912189332552);
INSERT INTO public.crop_coordinates (id, crop_id, longtitute, latitude) VALUES (4, 1, 35.2678228865794, 25.1915048504198);
INSERT INTO public.crop_coordinates (id, crop_id, longtitute, latitude) VALUES (5, 1, 35.2677496224465, 25.1914368143923);
INSERT INTO public.crop_coordinates (id, crop_id, longtitute, latitude) VALUES (6, 1, 35.2674125740957, 25.1909943828089);
INSERT INTO public.crop_coordinates (id, crop_id, longtitute, latitude) VALUES (7, 1, 35.2674966397657, 25.1908591144384);
INSERT INTO public.crop_coordinates (id, crop_id, longtitute, latitude) VALUES (8, 1, 35.2675618863797, 25.1907203602372);
INSERT INTO public.crop_coordinates (id, crop_id, longtitute, latitude) VALUES (9, 1, 35.2676150289442, 25.1906104083596);
INSERT INTO public.crop_coordinates (id, crop_id, longtitute, latitude) VALUES (10, 1, 35.2679287234295, 25.1909972646561);


--
-- Data for Name: crop_type_name
--

INSERT INTO public.crop_type_name (id, crop_type_id, language_id, name) VALUES (1, 1, 1, 'Οlive trees (grown trees)');
INSERT INTO public.crop_type_name (id, crop_type_id, language_id, name) VALUES (2, 2, 1, 'Table grapes (grown stems)');
INSERT INTO public.crop_type_name (id, crop_type_id, language_id, name) VALUES (3, 3, 1, 'Wine grapes (grown stems)');
INSERT INTO public.crop_type_name (id, crop_type_id, language_id, name) VALUES (4, 1, 2, 'Ελιές (ανεπτυγμένα δέντρα)');
INSERT INTO public.crop_type_name (id, crop_type_id, language_id, name) VALUES (5, 2, 2, 'Αμπέλι επιτραπέζιο (ανεπτυγμένα πρέμνα)');
INSERT INTO public.crop_type_name (id, crop_type_id, language_id, name) VALUES (6, 3, 2, 'Αμπέλι οινοποιήσιμο (ανεπτυγμένα πρέμνα)');
INSERT INTO public.crop_type_name (id, crop_type_id, language_id, name) VALUES (7, 4, 1, 'Citrus fruits (grown trees)');
INSERT INTO public.crop_type_name (id, crop_type_id, language_id, name) VALUES (8, 5, 1, 'Avocado (grown trees)');
INSERT INTO public.crop_type_name (id, crop_type_id, language_id, name) VALUES (9, 6, 1, 'Avocado (trees less than 4 years old)');
INSERT INTO public.crop_type_name (id, crop_type_id, language_id, name) VALUES (10, 4, 2, 'Εσπεριδοειδή');
INSERT INTO public.crop_type_name (id, crop_type_id, language_id, name) VALUES (11, 5, 2, 'Αβοκάντο (ανεπτυγμένα δέντρα)');
INSERT INTO public.crop_type_name (id, crop_type_id, language_id, name) VALUES (12, 6, 2, 'Αβοκάντο (δέντρα ηλικίας μικρότερης των 4 ετών)');


--
-- Data for Name: prefecture_name
--

INSERT INTO public.prefecture_name (id, prefecture_id, language_id, name) VALUES (1, 1, 1, 'Heraklion');
INSERT INTO public.prefecture_name (id, prefecture_id, language_id, name) VALUES (2, 2, 1, 'Chania');
INSERT INTO public.prefecture_name (id, prefecture_id, language_id, name) VALUES (3, 3, 1, 'Rethymno');
INSERT INTO public.prefecture_name (id, prefecture_id, language_id, name) VALUES (4, 4, 1, 'Lasithi');
INSERT INTO public.prefecture_name (id, prefecture_id, language_id, name) VALUES (5, 1, 2, 'Ηράκλειο');
INSERT INTO public.prefecture_name (id, prefecture_id, language_id, name) VALUES (6, 2, 2, 'Χανιά');
INSERT INTO public.prefecture_name (id, prefecture_id, language_id, name) VALUES (7, 3, 2, 'Ρέθυμνο');
INSERT INTO public.prefecture_name (id, prefecture_id, language_id, name) VALUES (8, 4, 2, 'Λασίθι');


--
-- Data for Name: region_bulletin
--

INSERT INTO public.region_bulletin (id, start_date, end_date) VALUES (1, '2024-05-02 00:00:00', '2024-05-08 00:00:00');
INSERT INTO public.region_bulletin (id, start_date, end_date) VALUES (2, '2024-05-09 00:00:00', '2024-05-15 00:00:00');
INSERT INTO public.region_bulletin (id, start_date, end_date) VALUES (3, '2024-05-16 00:00:00', '2024-05-22 00:00:00');
INSERT INTO public.region_bulletin (id, start_date, end_date) VALUES (4, '2024-05-23 00:00:00', '2024-05-29 00:00:00');
INSERT INTO public.region_bulletin (id, start_date, end_date) VALUES (5, '2024-05-30 00:00:00', '2024-06-05 00:00:00');
INSERT INTO public.region_bulletin (id, start_date, end_date) VALUES (6, '2024-06-06 00:00:00', '2024-06-12 00:00:00');
INSERT INTO public.region_bulletin (id, start_date, end_date) VALUES (7, '2024-06-13 00:00:00', '2024-06-19 00:00:00');
INSERT INTO public.region_bulletin (id, start_date, end_date) VALUES (8, '2024-06-20 00:00:00', '2024-06-26 00:00:00');
INSERT INTO public.region_bulletin (id, start_date, end_date) VALUES (9, '2024-06-27 00:00:00', '2024-07-03 00:00:00');
INSERT INTO public.region_bulletin (id, start_date, end_date) VALUES (10, '2024-07-04 00:00:00', '2024-07-10 00:00:00');
INSERT INTO public.region_bulletin (id, start_date, end_date) VALUES (11, '2024-07-11 00:00:00', '2024-07-17 00:00:00');
INSERT INTO public.region_bulletin (id, start_date, end_date) VALUES (12, '2024-07-18 00:00:00', '2024-07-24 00:00:00');
INSERT INTO public.region_bulletin (id, start_date, end_date) VALUES (13, '2024-07-25 00:00:00', '2024-07-31 00:00:00');
INSERT INTO public.region_bulletin (id, start_date, end_date) VALUES (14, '2024-08-01 00:00:00', '2024-08-07 00:00:00');
INSERT INTO public.region_bulletin (id, start_date, end_date) VALUES (15, '2024-08-08 00:00:00', '2024-08-14 00:00:00');
INSERT INTO public.region_bulletin (id, start_date, end_date) VALUES (16, '2024-08-15 00:00:00', '2024-08-21 00:00:00');
INSERT INTO public.region_bulletin (id, start_date, end_date) VALUES (17, '2024-08-22 00:00:00', '2024-08-28 00:00:00');


--
-- Data for Name: region_bulletin_data
--

INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (1, 1, 4, 17, 1, 1, 6, 1, 6);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (2, 1, 4, 17, 1, 2, 6, 1, 6);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (3, 1, 4, 17, 1, 3, 6, 1, 6);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (4, 1, 4, 17, 2, 1, 4, 1, 4);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (5, 1, 4, 17, 2, 2, 4, 1, 4);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (6, 1, 4, 17, 2, 3, 4, 1, 4);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (7, 1, 4, 17, 3, 1, 4, 1, 4);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (8, 1, 4, 17, 3, 2, 4, 1, 4);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (9, 1, 4, 17, 3, 3, 4, 1, 4);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (10, 1, 4, 18, 1, 1, 6, 1, 6);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (11, 1, 4, 18, 1, 2, 6, 1, 6);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (12, 1, 4, 18, 1, 3, 6, 1, 6);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (13, 1, 4, 18, 2, 1, 4, 1, 4);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (14, 1, 4, 18, 2, 2, 4, 1, 4);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (15, 1, 4, 18, 2, 3, 4, 1, 4);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (16, 1, 4, 18, 3, 1, 4, 1, 4);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (17, 1, 4, 18, 3, 2, 4, 1, 4);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (18, 1, 4, 18, 3, 3, 4, 1, 4);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (19, 1, 4, 19, 1, 1, 7, 1, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (20, 1, 4, 19, 1, 2, 7, 1, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (21, 1, 4, 19, 1, 3, 7, 1, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (22, 2, 4, 17, 1, 1, 0, 0, 0);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (23, 2, 4, 17, 1, 2, 0, 0, 0);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (24, 2, 4, 17, 1, 3, 0, 0, 0);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (25, 2, 4, 17, 2, 1, 0, 0, 0);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (26, 2, 4, 17, 2, 2, 0, 0, 0);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (27, 2, 4, 17, 2, 3, 0, 0, 0);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (28, 2, 4, 17, 3, 1, 0, 0, 0);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (29, 2, 4, 17, 3, 2, 0, 0, 0);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (30, 2, 4, 17, 3, 3, 0, 0, 0);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (31, 2, 4, 18, 1, 1, 0, 0, 0);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (32, 2, 4, 18, 1, 2, 0, 0, 0);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (33, 2, 4, 18, 1, 3, 0, 0, 0);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (34, 2, 4, 18, 2, 1, 0, 0, 0);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (35, 2, 4, 18, 2, 2, 0, 0, 0);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (36, 2, 4, 18, 2, 3, 0, 0, 0);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (37, 2, 4, 18, 3, 1, 0, 0, 0);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (38, 2, 4, 18, 3, 2, 0, 0, 0);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (39, 2, 4, 18, 3, 3, 0, 0, 0);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (40, 2, 4, 19, 1, 1, 0, 0, 0);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (41, 2, 4, 19, 1, 2, 0, 0, 0);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (42, 2, 4, 19, 1, 3, 0, 0, 0);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (43, 3, 4, 17, 1, 1, 5, 1, 5);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (44, 3, 4, 17, 1, 2, 5, 1, 5);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (45, 3, 4, 17, 1, 3, 5, 1, 5);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (46, 3, 4, 17, 2, 1, 5, 1, 5);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (47, 3, 4, 17, 2, 2, 5, 1, 5);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (48, 3, 4, 17, 2, 3, 5, 1, 5);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (49, 3, 4, 17, 3, 1, 5, 1, 5);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (50, 3, 4, 17, 3, 2, 5, 1, 5);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (51, 3, 4, 17, 3, 3, 5, 1, 5);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (52, 3, 4, 18, 1, 1, 0, 0, 0);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (53, 3, 4, 18, 1, 2, 0, 0, 0);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (54, 3, 4, 18, 1, 3, 0, 0, 0);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (55, 3, 4, 18, 2, 1, 0, 0, 0);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (56, 3, 4, 18, 2, 2, 0, 0, 0);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (57, 3, 4, 18, 2, 3, 0, 0, 0);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (58, 3, 4, 18, 3, 1, 0, 0, 0);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (59, 3, 4, 18, 3, 2, 0, 0, 0);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (60, 3, 4, 18, 3, 3, 0, 0, 0);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (61, 3, 4, 19, 1, 1, 6, 1, 6);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (62, 3, 4, 19, 1, 2, 6, 1, 6);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (63, 3, 4, 19, 1, 3, 6, 1, 6);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (64, 4, 4, 17, 1, 1, 6, 1, 6);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (65, 4, 4, 17, 1, 2, 6, 1, 6);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (66, 4, 4, 17, 1, 3, 6, 1, 6);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (67, 4, 4, 17, 2, 1, 7, 1, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (68, 4, 4, 17, 2, 2, 7, 1, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (69, 4, 4, 17, 2, 3, 7, 1, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (70, 4, 4, 17, 3, 1, 7, 1, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (71, 4, 4, 17, 3, 2, 7, 1, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (72, 4, 4, 17, 3, 3, 7, 1, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (73, 4, 4, 18, 1, 1, 6, 1, 6);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (74, 4, 4, 18, 1, 2, 6, 1, 6);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (75, 4, 4, 18, 1, 3, 6, 1, 6);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (76, 4, 4, 18, 2, 1, 7, 1, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (77, 4, 4, 18, 2, 2, 7, 1, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (78, 4, 4, 18, 2, 3, 7, 1, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (79, 4, 4, 18, 3, 1, 7, 1, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (80, 4, 4, 18, 3, 2, 7, 1, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (81, 4, 4, 18, 3, 3, 7, 1, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (82, 4, 4, 19, 1, 1, 6, 1, 6);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (83, 4, 4, 19, 1, 2, 6, 1, 6);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (84, 4, 4, 19, 1, 3, 6, 1, 6);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (85, 5, 4, 17, 1, 1, 7, 1, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (86, 5, 4, 17, 1, 2, 7, 1, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (87, 5, 4, 17, 1, 3, 7, 1, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (88, 5, 4, 17, 2, 1, 8, 1, 1);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (89, 5, 4, 17, 2, 2, 8, 1, 1);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (90, 5, 4, 17, 2, 3, 8, 1, 1);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (91, 5, 4, 17, 3, 1, 8, 1, 1);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (92, 5, 4, 17, 3, 2, 8, 1, 1);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (93, 5, 4, 17, 3, 3, 8, 1, 1);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (94, 5, 4, 18, 1, 1, 3, 1, 3);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (95, 5, 4, 18, 1, 2, 3, 1, 3);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (96, 5, 4, 18, 1, 3, 3, 1, 3);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (97, 5, 4, 18, 2, 1, 4, 1, 4);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (98, 5, 4, 18, 2, 2, 4, 1, 4);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (99, 5, 4, 18, 2, 3, 4, 1, 4);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (100, 5, 4, 18, 3, 1, 4, 1, 4);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (101, 5, 4, 18, 3, 2, 4, 1, 4);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (102, 5, 4, 18, 3, 3, 4, 1, 4);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (103, 5, 4, 19, 1, 1, 7, 1, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (104, 5, 4, 19, 1, 2, 7, 1, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (105, 5, 4, 19, 1, 3, 7, 1, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (106, 6, 4, 17, 1, 1, 9, 1, 9);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (107, 6, 4, 17, 1, 2, 9, 1, 9);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (108, 6, 4, 17, 1, 3, 9, 1, 9);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (109, 6, 4, 17, 2, 1, 12, 2, 6);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (110, 6, 4, 17, 2, 2, 12, 2, 6);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (111, 6, 4, 17, 2, 3, 12, 2, 6);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (112, 6, 4, 17, 3, 1, 12, 2, 6);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (113, 6, 4, 17, 3, 2, 12, 2, 6);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (114, 6, 4, 17, 3, 3, 12, 2, 6);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (115, 6, 4, 18, 1, 1, 8, 1, 8);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (116, 6, 4, 18, 1, 2, 8, 1, 8);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (117, 6, 4, 18, 1, 3, 8, 1, 8);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (118, 6, 4, 18, 2, 1, 11, 2, 5.5);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (119, 6, 4, 18, 2, 2, 11, 1, 1);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (120, 6, 4, 18, 2, 3, 11, 1, 1);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (121, 6, 4, 18, 3, 1, 11, 2, 5.5);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (122, 6, 4, 18, 3, 2, 11, 1, 1);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (123, 6, 4, 18, 3, 3, 11, 1, 1);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (124, 6, 4, 19, 1, 1, 9, 1, 9);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (125, 6, 4, 19, 1, 2, 9, 1, 9);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (126, 6, 4, 19, 1, 3, 9, 1, 9);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (127, 7, 4, 17, 1, 1, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (128, 7, 4, 17, 1, 2, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (129, 7, 4, 17, 1, 3, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (130, 7, 4, 17, 2, 1, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (131, 7, 4, 17, 2, 2, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (132, 7, 4, 17, 2, 3, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (133, 7, 4, 17, 3, 1, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (134, 7, 4, 17, 3, 2, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (135, 7, 4, 17, 3, 3, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (136, 7, 4, 18, 1, 1, 11, 1, 11);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (137, 7, 4, 18, 1, 2, 11, 1, 11);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (138, 7, 4, 18, 1, 3, 11, 1, 11);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (139, 7, 4, 18, 2, 1, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (140, 7, 4, 18, 2, 2, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (141, 7, 4, 18, 2, 3, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (142, 7, 4, 18, 3, 1, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (143, 7, 4, 18, 3, 2, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (144, 7, 4, 18, 3, 3, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (145, 7, 4, 19, 1, 1, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (146, 7, 4, 19, 1, 2, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (147, 7, 4, 19, 1, 3, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (148, 8, 4, 17, 1, 1, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (149, 8, 4, 17, 1, 2, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (150, 8, 4, 17, 1, 3, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (151, 8, 4, 17, 2, 1, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (152, 8, 4, 17, 2, 2, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (153, 8, 4, 17, 2, 3, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (154, 8, 4, 17, 3, 1, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (155, 8, 4, 17, 3, 2, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (156, 8, 4, 17, 3, 3, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (157, 8, 4, 18, 1, 1, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (158, 8, 4, 18, 1, 2, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (159, 8, 4, 18, 1, 3, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (160, 8, 4, 18, 2, 1, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (161, 8, 4, 18, 2, 2, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (162, 8, 4, 18, 2, 3, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (163, 8, 4, 18, 3, 1, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (164, 8, 4, 18, 3, 2, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (165, 8, 4, 18, 3, 3, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (166, 8, 4, 19, 1, 1, 11, 1, 11);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (167, 8, 4, 19, 1, 2, 11, 1, 11);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (168, 8, 4, 19, 1, 3, 11, 1, 11);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (169, 8, 4, 20, 1, 1, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (170, 8, 4, 20, 1, 2, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (171, 8, 4, 20, 1, 3, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (172, 9, 4, 17, 1, 1, 9, 1, 9);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (173, 9, 4, 17, 1, 2, 9, 1, 9);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (174, 9, 4, 17, 1, 3, 9, 1, 9);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (175, 9, 4, 17, 2, 1, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (176, 9, 4, 17, 2, 2, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (177, 9, 4, 17, 2, 3, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (178, 9, 4, 17, 3, 1, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (179, 9, 4, 17, 3, 2, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (180, 9, 4, 17, 3, 3, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (181, 9, 4, 18, 1, 1, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (182, 9, 4, 18, 1, 2, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (183, 9, 4, 18, 1, 3, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (184, 9, 4, 18, 2, 1, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (185, 9, 4, 18, 2, 2, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (186, 9, 4, 18, 2, 3, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (187, 9, 4, 18, 3, 1, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (188, 9, 4, 18, 3, 2, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (189, 9, 4, 18, 3, 3, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (190, 9, 4, 19, 1, 1, 11, 1, 11);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (191, 9, 4, 19, 1, 2, 11, 1, 11);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (192, 9, 4, 19, 1, 3, 11, 1, 11);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (193, 9, 4, 20, 1, 1, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (194, 9, 4, 20, 1, 2, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (195, 9, 4, 20, 1, 3, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (196, 10, 4, 17, 1, 1, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (197, 10, 4, 17, 1, 2, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (198, 10, 4, 17, 1, 3, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (199, 10, 4, 17, 2, 1, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (200, 10, 4, 17, 2, 2, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (201, 10, 4, 17, 2, 3, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (202, 10, 4, 17, 3, 1, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (203, 10, 4, 17, 3, 2, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (204, 10, 4, 17, 3, 3, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (205, 10, 4, 18, 1, 1, 9, 1, 9);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (206, 10, 4, 18, 1, 2, 9, 1, 9);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (207, 10, 4, 18, 1, 3, 9, 1, 9);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (208, 10, 4, 18, 2, 1, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (209, 10, 4, 18, 2, 2, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (210, 10, 4, 18, 2, 3, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (211, 10, 4, 18, 3, 1, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (212, 10, 4, 18, 3, 2, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (213, 10, 4, 18, 3, 3, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (214, 10, 4, 19, 1, 1, 11, 1, 11);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (215, 10, 4, 19, 1, 2, 11, 1, 11);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (216, 10, 4, 19, 1, 3, 11, 1, 11);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (217, 10, 4, 20, 1, 1, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (218, 10, 4, 20, 1, 2, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (219, 10, 4, 20, 1, 3, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (220, 11, 4, 17, 1, 1, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (221, 11, 4, 17, 1, 2, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (222, 11, 4, 17, 1, 3, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (223, 11, 4, 17, 2, 1, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (224, 11, 4, 17, 2, 2, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (225, 11, 4, 17, 2, 3, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (226, 11, 4, 17, 3, 1, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (227, 11, 4, 17, 3, 2, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (228, 11, 4, 17, 3, 3, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (229, 11, 4, 18, 1, 1, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (230, 11, 4, 18, 1, 2, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (231, 11, 4, 18, 1, 3, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (232, 11, 4, 18, 2, 1, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (233, 11, 4, 18, 2, 2, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (234, 11, 4, 18, 2, 3, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (235, 11, 4, 18, 3, 1, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (236, 11, 4, 18, 3, 2, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (237, 11, 4, 18, 3, 3, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (238, 11, 4, 19, 1, 1, 12, 2, 6);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (239, 11, 4, 19, 1, 2, 12, 1, 12);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (240, 11, 4, 19, 1, 3, 12, 1, 12);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (241, 11, 4, 20, 1, 1, 11, 1, 11);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (242, 11, 4, 20, 1, 2, 11, 1, 11);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (243, 11, 4, 20, 1, 3, 11, 1, 11);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (244, 12, 4, 17, 1, 1, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (245, 12, 4, 17, 1, 2, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (246, 12, 4, 17, 1, 3, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (247, 12, 4, 17, 2, 1, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (248, 12, 4, 17, 2, 2, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (249, 12, 4, 17, 2, 3, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (250, 12, 4, 17, 3, 1, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (251, 12, 4, 17, 3, 2, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (252, 12, 4, 17, 3, 3, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (253, 12, 4, 18, 1, 1, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (254, 12, 4, 18, 1, 2, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (255, 12, 4, 18, 1, 3, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (256, 12, 4, 18, 2, 1, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (257, 12, 4, 18, 2, 2, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (258, 12, 4, 18, 2, 3, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (259, 12, 4, 18, 3, 1, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (260, 12, 4, 18, 3, 2, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (261, 12, 4, 18, 3, 3, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (262, 12, 4, 19, 1, 1, 11, 1, 11);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (263, 12, 4, 19, 1, 2, 11, 1, 11);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (264, 12, 4, 19, 1, 3, 11, 1, 11);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (265, 12, 4, 20, 1, 1, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (266, 12, 4, 20, 1, 2, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (267, 12, 4, 20, 1, 3, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (268, 13, 4, 17, 1, 1, 9, 1, 9);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (269, 13, 4, 17, 1, 2, 9, 1, 9);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (270, 13, 4, 17, 1, 3, 9, 1, 9);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (271, 13, 4, 17, 2, 1, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (272, 13, 4, 17, 2, 2, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (273, 13, 4, 17, 2, 3, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (274, 13, 4, 17, 3, 1, 12, 2, 6);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (275, 13, 4, 17, 3, 2, 12, 2, 6);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (276, 13, 4, 17, 3, 3, 12, 2, 6);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (277, 13, 4, 18, 1, 1, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (278, 13, 4, 18, 1, 2, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (279, 13, 4, 18, 1, 3, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (280, 13, 4, 18, 2, 1, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (281, 13, 4, 18, 2, 2, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (282, 13, 4, 18, 2, 3, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (283, 13, 4, 18, 3, 1, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (284, 13, 4, 18, 3, 2, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (285, 13, 4, 18, 3, 3, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (286, 13, 4, 19, 1, 1, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (287, 13, 4, 19, 1, 2, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (288, 13, 4, 19, 1, 3, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (289, 13, 4, 20, 1, 1, 9, 1, 9);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (290, 13, 4, 20, 1, 2, 9, 1, 9);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (291, 13, 4, 20, 1, 3, 9, 1, 9);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (292, 14, 4, 17, 1, 1, 9, 1, 9);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (293, 14, 4, 17, 1, 2, 9, 1, 9);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (294, 14, 4, 17, 1, 3, 9, 1, 9);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (295, 14, 4, 17, 2, 1, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (296, 14, 4, 17, 2, 2, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (297, 14, 4, 17, 2, 3, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (298, 14, 4, 17, 3, 1, 10, 2, 5);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (299, 14, 4, 17, 3, 2, 10, 2, 5);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (300, 14, 4, 17, 3, 3, 10, 2, 5);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (301, 14, 4, 18, 1, 1, 9, 1, 9);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (302, 14, 4, 18, 1, 2, 9, 1, 9);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (303, 14, 4, 18, 1, 3, 9, 1, 9);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (304, 14, 4, 18, 2, 1, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (305, 14, 4, 18, 2, 2, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (306, 14, 4, 18, 2, 3, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (307, 14, 4, 18, 3, 1, 10, 2, 5);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (308, 14, 4, 18, 3, 2, 10, 2, 5);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (309, 14, 4, 18, 3, 3, 10, 2, 5);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (310, 14, 4, 19, 1, 1, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (311, 14, 4, 19, 1, 2, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (312, 14, 4, 19, 1, 3, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (313, 14, 4, 20, 1, 1, 9, 1, 9);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (314, 14, 4, 20, 1, 2, 9, 1, 9);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (315, 14, 4, 20, 1, 3, 9, 1, 9);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (316, 15, 4, 17, 1, 1, 11, 1, 11);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (317, 15, 4, 17, 1, 2, 11, 1, 11);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (318, 15, 4, 17, 1, 3, 11, 1, 11);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (319, 15, 4, 17, 2, 1, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (320, 15, 4, 17, 2, 2, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (321, 15, 4, 17, 2, 3, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (322, 15, 4, 17, 3, 1, 4, 1, 4);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (323, 15, 4, 17, 3, 2, 4, 1, 4);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (324, 15, 4, 17, 3, 3, 4, 1, 4);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (325, 15, 4, 18, 1, 1, 11, 1, 11);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (326, 15, 4, 18, 1, 2, 11, 1, 11);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (327, 15, 4, 18, 1, 3, 11, 1, 11);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (328, 15, 4, 18, 2, 1, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (329, 15, 4, 18, 2, 2, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (330, 15, 4, 18, 2, 3, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (331, 15, 4, 18, 3, 1, 10, 2, 5);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (332, 15, 4, 18, 3, 2, 10, 2, 5);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (333, 15, 4, 18, 3, 3, 10, 2, 5);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (334, 15, 4, 19, 1, 1, 12, 1, 12);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (335, 15, 4, 19, 1, 2, 12, 1, 12);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (336, 15, 4, 19, 1, 3, 12, 1, 12);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (337, 15, 4, 20, 1, 1, 11, 1, 11);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (338, 15, 4, 20, 1, 2, 11, 1, 11);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (339, 15, 4, 20, 1, 3, 11, 1, 11);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (340, 16, 4, 17, 1, 1, 11, 1, 11);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (341, 16, 4, 17, 1, 2, 11, 1, 11);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (342, 16, 4, 17, 1, 3, 11, 1, 11);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (343, 16, 4, 17, 2, 1, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (344, 16, 4, 17, 2, 2, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (345, 16, 4, 17, 2, 3, 14, 2, 7);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (346, 16, 4, 17, 3, 1, 0, 0, 0);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (347, 16, 4, 17, 3, 2, 0, 0, 0);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (348, 16, 4, 17, 3, 3, 0, 0, 0);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (349, 16, 4, 18, 1, 1, 11, 1, 11);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (350, 16, 4, 18, 1, 2, 11, 1, 11);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (351, 16, 4, 18, 1, 3, 11, 1, 11);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (352, 16, 4, 18, 2, 1, 12, 2, 6);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (353, 16, 4, 18, 2, 2, 12, 2, 6);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (354, 16, 4, 18, 2, 3, 12, 2, 6);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (355, 16, 4, 18, 3, 1, 0, 0, 0);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (356, 16, 4, 18, 3, 2, 0, 0, 0);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (357, 16, 4, 18, 3, 3, 0, 0, 0);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (358, 16, 4, 19, 1, 1, 12, 1, 12);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (359, 16, 4, 19, 1, 2, 12, 1, 12);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (360, 16, 4, 19, 1, 3, 12, 1, 12);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (361, 16, 4, 20, 1, 1, 12, 1, 12);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (362, 16, 4, 20, 1, 2, 12, 1, 12);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (363, 16, 4, 20, 1, 3, 12, 1, 12);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (364, 17, 4, 17, 1, 1, 5, 1, 5);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (365, 17, 4, 17, 1, 2, 5, 1, 5);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (366, 17, 4, 17, 1, 3, 5, 1, 5);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (367, 17, 4, 17, 2, 1, 5, 1, 5);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (368, 17, 4, 17, 2, 2, 5, 1, 5);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (369, 17, 4, 17, 2, 3, 5, 1, 5);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (370, 17, 4, 17, 3, 1, 0, 0, 0);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (371, 17, 4, 17, 3, 2, 0, 0, 0);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (372, 17, 4, 17, 3, 3, 0, 0, 0);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (373, 17, 4, 18, 1, 1, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (374, 17, 4, 18, 1, 2, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (375, 17, 4, 18, 1, 3, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (376, 17, 4, 18, 2, 1, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (377, 17, 4, 18, 2, 2, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (378, 17, 4, 18, 2, 3, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (379, 17, 4, 18, 3, 1, 0, 0, 0);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (380, 17, 4, 18, 3, 2, 0, 0, 0);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (381, 17, 4, 18, 3, 3, 0, 0, 0);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (382, 17, 4, 19, 1, 1, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (383, 17, 4, 19, 1, 2, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (384, 17, 4, 19, 1, 3, 10, 1, 10);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (385, 17, 4, 20, 1, 1, 9, 1, 9);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (386, 17, 4, 20, 1, 2, 9, 1, 9);
INSERT INTO public.region_bulletin_data (id, bulletin, prefecture, area, crop_type, soil_type, irrigation_need, irrigation_number, irrigation_dose) VALUES (387, 17, 4, 20, 1, 3, 9, 1, 9);


--
-- Data for Name: sensor
--

INSERT INTO public.sensor (id, loc_longtitute, loc_latitude, crop_id) VALUES (1, 35.2677496224465, 25.1914368143923, 1);


--
-- Data for Name: sensor_data
--



--
-- Data for Name: soil_type_name
--

INSERT INTO public.soil_type_name (id, soil_type_id, language_id, name) VALUES (1, 1, 1, 'Light');
INSERT INTO public.soil_type_name (id, soil_type_id, language_id, name) VALUES (2, 2, 1, 'Medium');
INSERT INTO public.soil_type_name (id, soil_type_id, language_id, name) VALUES (3, 3, 1, 'Heavy');
INSERT INTO public.soil_type_name (id, soil_type_id, language_id, name) VALUES (4, 1, 2, 'Ελαφρύ');
INSERT INTO public.soil_type_name (id, soil_type_id, language_id, name) VALUES (5, 2, 2, 'Μέσο');
INSERT INTO public.soil_type_name (id, soil_type_id, language_id, name) VALUES (6, 3, 2, 'Βαρύ');


--
-- Name: area_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ua13a1vvbd6pci
--

SELECT pg_catalog.setval('public.area_id_seq', 1, false);


--
-- Name: area_name_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ua13a1vvbd6pci
--

SELECT pg_catalog.setval('public.area_name_id_seq', 1, false);


--
-- Name: crop_coordinates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ua13a1vvbd6pci
--

SELECT pg_catalog.setval('public.crop_coordinates_id_seq', 165, true);


--
-- Name: crop_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ua13a1vvbd6pci
--

SELECT pg_catalog.setval('public.crop_id_seq', 99, true);


--
-- Name: crop_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ua13a1vvbd6pci
--

SELECT pg_catalog.setval('public.crop_type_id_seq', 1, false);


--
-- Name: crop_type_name_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ua13a1vvbd6pci
--

SELECT pg_catalog.setval('public.crop_type_name_id_seq', 1, false);


--
-- Name: language_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ua13a1vvbd6pci
--

SELECT pg_catalog.setval('public.language_id_seq', 1, false);


--
-- Name: prefecture_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ua13a1vvbd6pci
--

SELECT pg_catalog.setval('public.prefecture_id_seq', 1, false);


--
-- Name: prefecture_name_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ua13a1vvbd6pci
--

SELECT pg_catalog.setval('public.prefecture_name_id_seq', 1, false);


--
-- Name: region_bulletin_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ua13a1vvbd6pci
--

SELECT pg_catalog.setval('public.region_bulletin_data_id_seq', 387, true);


--
-- Name: region_bulletin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ua13a1vvbd6pci
--

SELECT pg_catalog.setval('public.region_bulletin_id_seq', 17, true);


--
-- Name: sensor_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ua13a1vvbd6pci
--

SELECT pg_catalog.setval('public.sensor_data_id_seq', 1, false);


--
-- Name: sensor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ua13a1vvbd6pci
--

SELECT pg_catalog.setval('public.sensor_id_seq', 1, false);


--
-- Name: soil_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ua13a1vvbd6pci
--

SELECT pg_catalog.setval('public.soil_type_id_seq', 1, false);


--
-- Name: soil_type_name_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ua13a1vvbd6pci
--

SELECT pg_catalog.setval('public.soil_type_name_id_seq', 1, false);


--
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: ua13a1vvbd6pci
--

SELECT pg_catalog.setval('public.user_id_seq', 66, true);


--
-- PostgreSQL database dump complete
--

