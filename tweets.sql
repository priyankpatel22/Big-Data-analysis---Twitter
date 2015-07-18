-- phpMyAdmin SQL Dump
-- version 3.2.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 02, 2014 at 02:23 AM
-- Server version: 5.1.44
-- PHP Version: 5.3.1

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `tweets`
--

-- --------------------------------------------------------

--
-- Table structure for table `tweetsInfo`
--

CREATE TABLE IF NOT EXISTS `tweetsInfo` (
  `SR_NUMBER` int(11) NOT NULL,
  `TWEET_ID` varchar(255) NOT NULL,
  `PRIMARY_TWEET_ID` varchar(255) NOT NULL,
  `TWEET_TIME` varchar(255) NOT NULL,
  `USER_NAME` varchar(255) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `NUMBER_OF_RETWEETS` int(11) NOT NULL,
  `NUMBER_OF_FAVORITE` int(11) NOT NULL,
  `TWEET_TEXT` varchar(5000) NOT NULL,
  `POSITIVE_STRENGTH` int(11) NOT NULL,
  `NEGATIVE_STRENGTH` int(11) NOT NULL,
  `INCLUDED_URL` varchar(2000) NOT NULL,
  `HASHTAG` varchar(1000) NOT NULL,
  PRIMARY KEY (`SR_NUMBER`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tweetsInfo`
--

INSERT INTO `tweetsInfo` (`SR_NUMBER`, `TWEET_ID`, `PRIMARY_TWEET_ID`, `TWEET_TIME`, `USER_NAME`, `USER_ID`, `NUMBER_OF_RETWEETS`, `NUMBER_OF_FAVORITE`, `TWEET_TEXT`, `POSITIVE_STRENGTH`, `NEGATIVE_STRENGTH`, `INCLUDED_URL`, `HASHTAG`) VALUES
(1, '495354547377025025', '495354114784911360', 'Fri Aug 01 23:45:02 +0000 2014', '????', '419671639', 4, 0, 'RT @DayhanaBanana: "@VanesssaaGrey: “@PostBaddBeautys: http://t.co/kc6cDsWoim” fuck ??" yummmmyyyyyyy ??', 2, -3, '', ''),
(2, '495354547049492480', '494901572669685760', 'Fri Aug 01 23:45:01 +0000 2014', 'Bean', '1253444486', 484, 0, 'RT @fvckrich: be straight up or don''t fuck with me period', 1, -1, '', ''),
(3, '495354546684956672', '495354477159776256', 'Fri Aug 01 23:45:01 +0000 2014', 'Ely', '939834186', 57, 0, 'RT @ThatOneGoodVibe: If we have the same taste in music, I fuck with you.', 1, -3, '', ''),
(4, '495354546601074689', '495345383070269440', 'Fri Aug 01 23:45:01 +0000 2014', '???', '2232403120', 4, 0, 'RT @blcvk: bruh how the fuck can the media\nbitch &amp; moan about one captured\nisraeli solider, when you got civilians dying in gaza. lol like …', 2, -3, '', ''),
(5, '495354545162436608', '490637923109584896', 'Fri Aug 01 23:45:01 +0000 2014', 'jenn caplan', '960400752', 3124, 0, 'RT @girlideas: simon says shut the fuck up', 1, -3, '', ''),
(6, '495354544973688834', '489223458866212865', 'Fri Aug 01 23:45:01 +0000 2014', 'Juli?tXx', '1252866714', 5529, 0, 'RT @trvpical: waiting for me to give a fuck http://t.co/XRJJDFZhFL', 1, -3, '', ''),
(7, '495354544617172993', '495141783115153408', 'Fri Aug 01 23:45:01 +0000 2014', '????  ?', '614633546', 792, 0, 'RT @oddfuckingtaco: fuck you', 1, -3, '', ''),
(8, '495354544600383488', '495354544600383488', 'Fri Aug 01 23:45:01 +0000 2014', 'i love Aisha', '1497261198', 2, 1, '"@FLEX0HOLIC: national shut the fuck up day"', 1, -3, '', ''),
(9, '495354543899951104', '495354477159776256', 'Fri Aug 01 23:45:01 +0000 2014', 'alexsa cabrera?', '2246037928', 80, 0, 'RT @ThatOneGoodVibe: If we have the same taste in music, I fuck with you.', 1, -3, '', ''),
(10, '495354543665061888', '494500559567593472', 'Fri Aug 01 23:45:01 +0000 2014', 'ßrian Schleicher', '1604279293', 426, 0, 'RT @TheBestFWA: Fuck the police http://t.co/2pOxQBGq1c', 1, -3, 'http://twitter.com/TheBestFWA/status/494500559567593472/photo/1', ''),
(11, '495354543392034816', '495352979633889280', 'Fri Aug 01 23:45:01 +0000 2014', 'IG: __Realblack', '161603818', 5, 0, 'RT @Gina_Kevins: Blowjobs are the second best thing a woman can ever do with her mouth, the first best thing is shutting the fuck up.', 2, -3, '', ''),
(12, '495354542129954816', '495348166494273536', 'Fri Aug 01 23:45:00 +0000 2014', 'J?', '285539288', 2, 0, 'RT @dakewarsame: “@ItsMisterEm: OI WHY HAS MY DAD STARTED LIFTING?! HE''S ACC TRAINING TO FUCK ME UP ON RESULTS DAY OMDS http://t.co/NvzYBKL…', 2, -3, '', ''),
(13, '495354542058250241', '495338772368617473', 'Fri Aug 01 23:45:00 +0000 2014', 'satan ', '424708099', 1, 0, 'RT @TravisPewarchuk: Wether its drugs or lifting never hate based on what someones idea of "fun" is. Do what ever the fuck makes you smile …', 3, -3, '', ''),
(14, '495354541416906752', '495354050205204482', 'Fri Aug 01 23:45:00 +0000 2014', 'autumn.', '349206478', 1, 0, 'RT @_JaayJones: Fuck today lol.', 2, -3, '', ''),
(15, '495354541173657601', '495354541173657601', 'Fri Aug 01 23:45:00 +0000 2014', 'Georgia Puncher', '261199967', 1, 0, 'why is Liv trying to send me Pinocchio quotes asif we''re not playing Harry potter wars what the fuck ?', 1, -3, '', ''),
(16, '495354541093945345', '489223458866212865', 'Fri Aug 01 23:45:00 +0000 2014', 'Grace Hickman', '633922813', 5554, 0, 'RT @trvpical: waiting for me to give a fuck http://t.co/XRJJDFZhFL', 1, -3, '', ''),
(17, '495354540888457217', '495351722332520448', 'Fri Aug 01 23:45:00 +0000 2014', 'dess.', '949156315', 4, 0, 'RT @N1tive: If you stuck up I can''t fuck with you ??', 1, -1, '', ''),
(18, '495354540687097856', '495354438585188352', 'Fri Aug 01 23:45:00 +0000 2014', '¢??? ?? ? ??', '2493206206', 1, 0, 'RT @Zakiyaaah: “@Talajaaah: @Zakiyaaah No ??” Well fuck you then ??', 2, -3, '', ''),
(19, '495354540032417793', '495305656715718656', 'Fri Aug 01 23:45:00 +0000 2014', 'FREE_PALESTINE', '2681472186', 2, 0, 'RT @marquisdesadie: @TurboHolborn @StanleyCohenLaw the trees have value to Israel,human life not so much #SaveGaza #savegazanchildren', 2, -1, '', ''),
(20, '495354539843674112', '495354433828421632', 'Fri Aug 01 23:45:00 +0000 2014', 'Daze ?', '783274561', 1, 0, 'RT @_capo97: “@YooDaze: School needs to block Facebook fuck the bullshit” ????????????', 1, -3, '', ''),
(21, '495354539181350912', '495016541503901696', 'Fri Aug 01 23:45:00 +0000 2014', 'Junior † Lady Gaga', '269058575', 23, 0, 'RT @HAUSofAITOR: FUCK YOU POP MUSIC THIS IS ARTPOP SWINEEEEE #MTVHottest Lady Gaga http://t.co/Q5nzLJdJr7', 2, -3, '', 'MTVHottest'),
(22, '495354539025776640', '405556984352894976', 'Fri Aug 01 23:45:00 +0000 2014', 'Don P', '1058521428', 27938, 0, 'RT @Rakwon_OGOD: Bitches will friendzone you then later say "but wyd" ... bitch I''m crying fuck u think I''m doing', 2, -4, '', ''),
(23, '495354538673451008', '495248394378825730', 'Fri Aug 01 23:44:59 +0000 2014', 'Uriel™', '596237092', 140, 0, 'RT @PoeticLove4: Fuck sleeping let''s get dis money??????', 1, -3, '', ''),
(24, '495354538522861568', '495350775011622912', 'Fri Aug 01 23:44:59 +0000 2014', 'The Berganator', '27550467', 5, 0, 'RT @funyword: I''m happy when you shut the fuck up.', 2, -3, '', ''),
(25, '495354538120208384', '495354413079613440', 'Fri Aug 01 23:44:59 +0000 2014', '#4yearsof1D', '1027000566', 8, 0, 'RT @TOMLlNOUlS: BUT LOUIS IS SO ADORABLE WHEN HES PISSED WHY IS THIS SO CUTE THE WAY HES TRYING TO BE ALL DEFIANT FUCK https://t.co/CZph9er…', 4, -3, 'https://vine.co/v/ME0DL0ueMJw', ''),
(26, '495354537994358784', '494500559567593472', 'Fri Aug 01 23:44:59 +0000 2014', 'Dylan', '290784740', 462, 0, 'RT @TheBestFWA: Fuck the police http://t.co/2pOxQBGq1c', 1, -3, 'http://twitter.com/TheBestFWA/status/494500559567593472/photo/1', ''),
(27, '495354537956216832', '495354477159776256', 'Fri Aug 01 23:44:59 +0000 2014', ' ? ', '2366208433', 100, 0, 'RT @ThatOneGoodVibe: If we have the same taste in music, I fuck with you.', 1, -3, '', ''),
(28, '495354537780453376', '480419264919531520', 'Fri Aug 01 23:44:59 +0000 2014', 'KALC', '2516750070', 127, 0, 'RT @_FLYONLY: Bitches on Twitter be dumb as fuck depending on Spell Check.. ????', 1, -3, '', ''),
(29, '495354537457504258', '495354537457504258', 'Fri Aug 01 23:44:59 +0000 2014', 'ZJS1?0?0?%', '2400141365', 29, 3, 'I only fuck with a few????', 1, -3, '', ''),
(30, '495354537381605376', '495248394378825730', 'Fri Aug 01 23:44:59 +0000 2014', 'HOUSTON GODDESS .', '1607760313', 140, 0, 'RT @PoeticLove4: Fuck sleeping let''s get dis money??????', 1, -3, '', ''),
(31, '495354536622452737', '495315932513042432', 'Fri Aug 01 23:44:59 +0000 2014', 'Cash Money Babee ', '885853454', 325, 0, 'RT @1EVILSAVAGE: WHEN YOUR MAMA TRY TO WHOOP YOU BUT YOU TOO GROWN FOR THAT SHIT http://t.co/nV9i5bpjni', 1, -2, '', ''),
(32, '495354536312463360', '495354432360824833', 'Fri Aug 01 23:44:59 +0000 2014', '$haisexton.', '379855161', 1, 0, 'RT @treflightmusic: "@ObeyShaiBro: I called you to say "I love you" she texted back saying "fuck you!"" famous words of a devil', 3, -3, '', ''),
(33, '495354535708479489', '489223458866212865', 'Fri Aug 01 23:44:59 +0000 2014', '?Jasmine ?', '239832106', 5659, 0, 'RT @trvpical: waiting for me to give a fuck http://t.co/XRJJDFZhFL', 1, -3, '', ''),
(34, '495354534764371968', '495338198630166528', 'Fri Aug 01 23:44:59 +0000 2014', 'Julien Vankerre', '1401704582', 92, 0, 'RT @StevStiffler: I stopped forgiving people because after I do they usually fuck up again', 2, -3, '', ''),
(35, '495354534332743681', '495354453461983232', 'Fri Aug 01 23:44:58 +0000 2014', '??KingJ??', '2239379823', 4, 0, 'RT @6775gell: GO FUCK WIT BRO @3200Blk_Ev http://t.co/13XS7CJIGW', 1, -3, '', ''),
(36, '495354533745152000', '495354533745152000', 'Fri Aug 01 23:44:58 +0000 2014', 'IG: __Realblack', '161603818', 1, 0, '!! “@Gina_Kevins: Blowjobs are the second best thing a woman can ever do with her mouth, the first best thing is shutting the fuck up.”', 2, -3, '', ''),
(37, '495354533091217408', '495354477159776256', 'Fri Aug 01 23:44:58 +0000 2014', '?psychedelic queen?', '2174454600', 130, 0, 'RT @ThatOneGoodVibe: If we have the same taste in music, I fuck with you.', 1, -3, '', ''),
(38, '495354532084604928', '495348147158151169', 'Fri Aug 01 23:44:58 +0000 2014', 'Jax h', '2378658527', 2, 0, 'RT @MarilynShephe15: Does Morrison have to order refugees shot on shore before our fucking ALP wake the fuck up and our racist media tell t…', 1, -3, '', ''),
(39, '495354531912241152', '495326290858491904', 'Fri Aug 01 23:44:58 +0000 2014', 'BBB', '2627781756', 346, 0, 'RT @L1LDebbie: The Internet can really make you feel like an ugly fuck', 2, -4, '', ''),
(40, '495354531505786880', '495354229390065664', 'Fri Aug 01 23:44:58 +0000 2014', 'Hannah Delaney', '2301868923', 36, 0, 'RT @yungtrxplord: 90% of the time i don''t know what the fuck i am doing', 1, -3, '', ''),
(41, '495354530452996097', '495354530452996097', 'Fri Aug 01 23:44:57 +0000 2014', '#jianca?', '1713211652', 1, 1, 'there are two different types of people \n"ily"\n"fuck my ass" http://t.co/wBuIWs24tN', 1, -3, '', ''),
(42, '495354529924542465', '495352565287366656', 'Fri Aug 01 23:44:57 +0000 2014', 'charl', '773631121', 1, 0, 'RT @AnnieSimpsonn: Fuck this', 1, -3, '', ''),
(43, '495354529916133376', '495354468624785408', 'Fri Aug 01 23:44:57 +0000 2014', 'hella pirate', '1454801581', 1, 0, 'RT @cyxoxx: @kenziesherwood2 @ckbae_ This is ridiculous. Kenzie get over it, you''re only hurting yourself. Courtney doesn''t give a fuck. lol', 2, -3, '', ''),
(44, '495354529270222848', '495339009166430208', 'Fri Aug 01 23:44:57 +0000 2014', 'Afnan ', '1011324182', 1, 0, 'RT @nanimarie26: You dont give a fuck. Then I dont give a fuck. See where it gets us.', 1, -3, '', ''),
(45, '495354529198931968', '489223458866212865', 'Fri Aug 01 23:44:57 +0000 2014', 'Reinè Sharnell', '2572790632', 5717, 0, 'RT @trvpical: waiting for me to give a fuck http://t.co/XRJJDFZhFL', 1, -3, '', ''),
(46, '495354528611721216', '495354065648644096', 'Fri Aug 01 23:44:57 +0000 2014', 'Please Ariana', '1653286340', 27, 0, 'RT @OnlyMyBiebah: Justin has that ''fuck you and your opinion'' attitude', 1, -3, '', ''),
(47, '495354528456511488', '495354528456511488', 'Fri Aug 01 23:44:57 +0000 2014', 'Moksh Gudala', '2336020915', 1, 2, '"i wanna fuck someone whose pussy smells like penguin" @willfullthinkin', 2, -3, '', ''),
(48, '495354528024125440', '495349581522038784', 'Fri Aug 01 23:44:57 +0000 2014', 'Tu Madreeee', '25118188', 1, 0, 'RT @FabriseMunoz: @MonicaJay17 I was on the bitch for  while till I said fuck it and consider it done. Y''all either in it all cien % or nah', 1, -3, '', ''),
(49, '495354527986376704', '495265652425244672', 'Fri Aug 01 23:44:57 +0000 2014', 'Trap A.', '156683636', 494, 0, 'RT @XavierWulf: who the fuck....is any of you.', 1, -3, '', ''),
(50, '495354527525392385', '495354260088180737', 'Fri Aug 01 23:44:57 +0000 2014', 'Chelsea Quarmby', '19120417', 1, 0, 'RT @Eann_Robinson: @ChelseaQuarmby fuck it! Enjoy tonight ??????', 3, -3, '', ''),
(51, '495354526346784769', '495354102197403648', 'Fri Aug 01 23:44:57 +0000 2014', 'Rubber Band Man', '120649580', 1, 0, 'RT @AndrewChapaaa: “@richiesoicey: @AndrewChapaaa lol fr boyz be ouchea pillow talkin mane” let fuck boyz be fuck fuck boyz ha', 2, -4, '', ''),
(52, '495354525826711553', '495354229390065664', 'Fri Aug 01 23:44:56 +0000 2014', 'Rocky', '184091749', 38, 0, 'RT @yungtrxplord: 90% of the time i don''t know what the fuck i am doing', 1, -3, '', ''),
(53, '495354524811689984', '495354524811689984', 'Fri Aug 01 23:44:56 +0000 2014', 'Tefii'' ?', '380078773', 1, 1, 'Eu amo o @umseronline  e nem é ele aqui =DDD', 1, -1, '', ''),
(54, '495354523805036545', '495354229390065664', 'Fri Aug 01 23:44:56 +0000 2014', 'vic', '362759379', 38, 0, 'RT @yungtrxplord: 90% of the time i don''t know what the fuck i am doing', 1, -3, '', ''),
(55, '495354523641479169', '495347035948584962', 'Fri Aug 01 23:44:56 +0000 2014', 'PRINCESS?', '2376515242', 55, 0, 'RT @lordflaconegro: Fuck a camel toe this bitch got that dolphin mouth http://t.co/W9C7jzOlPL', 1, -3, '', ''),
(56, '495354523356266496', '490637923109584896', 'Fri Aug 01 23:44:56 +0000 2014', 'SaraRae?', '550634419', 3193, 0, 'RT @girlideas: simon says shut the fuck up', 1, -3, '', ''),
(57, '495354523175890946', '495354523175890946', 'Fri Aug 01 23:44:56 +0000 2014', 'julie / 6 :))', '791460248', 1, 0, 'How the fuck are you guys laughing at what Justin said I find hella disgusting like im literally so ??!!!!!!!!!!', 2, -4, '', ''),
(58, '495354522865127424', '495353244877881344', 'Fri Aug 01 23:44:56 +0000 2014', 'Lisa', '2725953005', 2, 0, 'RT @l0verb00y: fuck what am i supposed to be impressed', 2, -3, '', ''),
(59, '495354522056032256', '405556984352894976', 'Fri Aug 01 23:44:56 +0000 2014', 'va?. ?', '2148973683', 27949, 0, 'RT @Rakwon_OGOD: Bitches will friendzone you then later say "but wyd" ... bitch I''m crying fuck u think I''m doing', 2, -4, '', ''),
(60, '495354521686933504', '490876533276286976', 'Fri Aug 01 23:44:55 +0000 2014', 'a$vp ????', '1628910446', 7704, 0, 'RT @koifresco: how about we grow the fuck up &amp; stop hating people for being different', 1, -4, '', ''),
(61, '495354521061580800', '495354292518522881', 'Fri Aug 01 23:44:55 +0000 2014', 'Alex', '939759992', 7, 0, 'RT @Richiesonora: "@pierrefitch: Soon coming live on @cockyboys http://t.co/sY2y4994JR   @RAFAELALENCAR  http://t.co/1KlptFL2Cm" #gayporn f…', 1, -1, 'http://cockypierre.com', 'gayporn'),
(62, '495354520957120512', '495350916099624961', 'Fri Aug 01 23:44:55 +0000 2014', 'Tony', '100636673', 15, 0, 'RT @TrippieGifs: fuck you http://t.co/QUfyJIhg3P', 1, -3, 'http://twitter.com/HippieGifs/status/489869261364396032/photo/1', ''),
(63, '495354520877432832', '495347664595476480', 'Fri Aug 01 23:44:55 +0000 2014', 'Tim', '554745694', 3, 0, 'RT @xCokeBoiCarlito: Then we fuck all night till things get right', 1, -3, '', ''),
(64, '495354520357306368', '495354520357306368', 'Fri Aug 01 23:44:55 +0000 2014', 'JusGlo', '1532526288', 1, 0, 'ion want ya bitch man she boring', 1, -2, '', ''),
(65, '495354520168173568', '495347751727935488', 'Fri Aug 01 23:44:55 +0000 2014', '??', '1036394569', 381, 0, 'RT @SamanthaCartel: Fuck everything that doesn''t make you happy??', 2, -3, '', ''),
(66, '495354519648481280', '495343300736348160', 'Fri Aug 01 23:44:55 +0000 2014', 'Griffindore', '429537095', 98, 0, 'RT @DeIish: how to seriously fuck with people http://t.co/iJfzwa8nNs', 1, -3, '', ''),
(67, '495354518658228227', '495354167268233216', 'Fri Aug 01 23:44:55 +0000 2014', 'cassieeee', '2424151405', 2, 0, 'RT @crushedzarry: I feel like this right now I can''t imagine my concert I''m nervous this is real as fuck', 2, -3, '', ''),
(68, '495354518348247041', '495353191371137024', 'Fri Aug 01 23:44:55 +0000 2014', 'Teenage Dirtbag', '1526992574', 1, 0, 'RT @Baked_Ziam: WHY THE FUCK DID ZAYN SHAVE I CANT KEEP UP WITH THIS BOY AND HIS FACIAL HAIR MAN', 1, -3, '', ''),
(69, '495354517966188544', '495354517966188544', 'Fri Aug 01 23:44:54 +0000 2014', 'Bink', '770004996', 1, 0, 'Fuck meya lol ????????????', 2, -3, '', ''),
(70, '495354517253521408', '494583538574831616', 'Fri Aug 01 23:44:54 +0000 2014', 'BIG D THE MOGUL', '1580543708', 2, 0, 'RT @_Unkraut_20: So excited for this shit!!!! It''s gonna be live as fuck http://t.co/3DbnGx1yLA', 3, -3, '', '');
