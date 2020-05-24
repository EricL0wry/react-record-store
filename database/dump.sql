--
-- PostgreSQL database dump
--

-- Dumped from database version 10.12
-- Dumped by pg_dump version 12.2

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

ALTER TABLE ONLY public.products DROP CONSTRAINT products_pkey;
ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
ALTER TABLE ONLY public.carts DROP CONSTRAINT carts_pkey;
ALTER TABLE ONLY public."cartItems" DROP CONSTRAINT "cartItems_pkey";
ALTER TABLE public.products ALTER COLUMN "productId" DROP DEFAULT;
ALTER TABLE public.orders ALTER COLUMN "orderId" DROP DEFAULT;
ALTER TABLE public.carts ALTER COLUMN "cartId" DROP DEFAULT;
ALTER TABLE public."cartItems" ALTER COLUMN "cartItemId" DROP DEFAULT;
DROP SEQUENCE public."products_productId_seq";
DROP TABLE public.products;
DROP SEQUENCE public."orders_orderId_seq";
DROP TABLE public.orders;
DROP SEQUENCE public."carts_cartId_seq";
DROP TABLE public.carts;
DROP SEQUENCE public."cartItems_cartItemId_seq";
DROP TABLE public."cartItems";
DROP EXTENSION plpgsql;
--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

--
-- Name: cartItems; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public."cartItems" (
    "cartItemId" integer NOT NULL,
    "cartId" integer NOT NULL,
    "productId" integer NOT NULL,
    price integer NOT NULL
);


--
-- Name: cartItems_cartItemId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."cartItems_cartItemId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: cartItems_cartItemId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."cartItems_cartItemId_seq" OWNED BY public."cartItems"."cartItemId";


--
-- Name: carts; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.carts (
    "cartId" integer NOT NULL,
    "createdAt" timestamp(6) with time zone DEFAULT now() NOT NULL
);


--
-- Name: carts_cartId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."carts_cartId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: carts_cartId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."carts_cartId_seq" OWNED BY public.carts."cartId";


--
-- Name: orders; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.orders (
    "orderId" integer NOT NULL,
    "cartId" integer NOT NULL,
    name text NOT NULL,
    "creditCard" text NOT NULL,
    "shippingAddress" text NOT NULL,
    "createdAt" timestamp(6) with time zone DEFAULT now() NOT NULL
);


--
-- Name: orders_orderId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."orders_orderId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: orders_orderId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."orders_orderId_seq" OWNED BY public.orders."orderId";


--
-- Name: products; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.products (
    "productId" integer NOT NULL,
    name text NOT NULL,
    price integer NOT NULL,
    image text NOT NULL,
    "shortDescription" text NOT NULL,
    "longDescription" text NOT NULL,
    "bandName" text,
    genre text,
    year integer
);


--
-- Name: products_productId_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public."products_productId_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: products_productId_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public."products_productId_seq" OWNED BY public.products."productId";


--
-- Name: cartItems cartItemId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."cartItems" ALTER COLUMN "cartItemId" SET DEFAULT nextval('public."cartItems_cartItemId_seq"'::regclass);


--
-- Name: carts cartId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carts ALTER COLUMN "cartId" SET DEFAULT nextval('public."carts_cartId_seq"'::regclass);


--
-- Name: orders orderId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders ALTER COLUMN "orderId" SET DEFAULT nextval('public."orders_orderId_seq"'::regclass);


--
-- Name: products productId; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products ALTER COLUMN "productId" SET DEFAULT nextval('public."products_productId_seq"'::regclass);


--
-- Data for Name: cartItems; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public."cartItems" ("cartItemId", "cartId", "productId", price) FROM stdin;
\.


--
-- Data for Name: carts; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.carts ("cartId", "createdAt") FROM stdin;
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.orders ("orderId", "cartId", name, "creditCard", "shippingAddress", "createdAt") FROM stdin;
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.products ("productId", name, price, image, "shortDescription", "longDescription", "bandName", genre, year) FROM stdin;
1	Abbey Road	4500	/images/AbbeyRoad.jpg	Limited Edition 180 gram 12"	Abbey Road is the eleventh studio album by the English rock band the Beatles, released on 26 September 1969 by Apple Records. Named after the location of EMI Studios in London, the cover features the group walking across the street's zebra crossing, an image that became one of the most famous and imitated in popular music. The album's initially mixed reviews were contrasted by its immediate commercial success, topping record charts in the UK and US. The lead single "Something" / "Come Together" was released in October and topped US charts.\nThe album incorporates genres such as blues, rock and pop, and makes prominent use of Moog synthesizer, sounds filtered through a Leslie speaker, and tom-tom drums. It is the Beatles' only album recorded exclusively through a solid-state transistor mixing desk, which afforded a clearer and brighter sound than the group's previous records. Side two contains a medley of song fragments edited together to form a single piece.	The Beatles	Rock	1969
2	Bookends	2800	/images/Bookends.jpg	Standard Edition 120 gram 12"	Bookends is the fourth studio album by American music duo Simon & Garfunkel. Produced by Paul Simon, Roy Halee and Art Garfunkel, the album was released on April 3, 1968, in the United States by Columbia Records. The duo had risen to fame two years prior with the albums Sounds of Silence and Parsley, Sage, Rosemary and Thyme and the soundtrack album for the 1967 film The Graduate.\nBookends is a concept album that explores a life journey from childhood to old age. Side one of the album marks successive stages in life, the theme serving as bookends to the life cycle. Side two largely consists of unused material for The Graduate soundtrack. Simon's lyrics concern youth, disillusionment, relationships, old age, and mortality. Much of the material was crafted alongside producer John Simon (no relation), who joined the recording when Paul Simon suffered from writer's block. The album was recorded gradually over the period of a year, with production speeding up around the later months of 1967.	Simon & Garfunkel	Folk Rock	1968
3	At Folsom Prison	3400	/images/Cash.jpg	Collector Edition 140 gram 12"	At Folsom Prison is a live album by Johnny Cash, released on Columbia Records in May 1968. After his 1955 song "Folsom Prison Blues", Cash had been interested in recording a performance at a prison. His idea was put on hold until 1967, when personnel changes at Columbia Records put Bob Johnston in charge of producing Cash's material. Cash had recently controlled his drug abuse problems, and was looking to turn his career around after several years of limited commercial success. Backed by June Carter, Carl Perkins and the Tennessee Three, Cash performed two shows at Folsom State Prison in California on January 13, 1968. The album consists of fifteen tracks from the first show and two tracks from the second.\nDespite little initial investment by Columbia, At Folsom Prison was a hit in the United States, reaching number one on the country charts and the top 15 of the national album chart. The lead single, a live version of "Folsom Prison Blues", was a top 40 hit, Cash's first since 1964's "Understand Your Man". At Folsom Prison received positive reviews and revitalized Cash's career.	Johnny Cash	Outlaw Country	1968
4	In Keeping Secrets of Silent Earth: 3	4200	/images/Coheed.jpg	Colored Vinyl 180 gram 12"	In Keeping Secrets of Silent Earth: 3 is the second studio album by rock quartet Coheed and Cambria. It was released on October 7, 2003, through Equal Vision Records. It was recorded at Applehead Recording, Woodstock, New York and produced by Michael Birnbaum and Chris Bittner.\nThe album is the second installment of a tetralogy about the ongoing saga of the Keywork in The Amory Wars. The Amory Wars is also the name of the graphic novel series written by lead singer Claudio Sanchez that details the events foretold in greater detail. There are three notable singles on this album: "A Favor House Atlantic", "Blood Red Summer" and "In Keeping Secrets of Silent Earth: 3".\nThe album peaked at #52 on the Billboard 200 and has sold over 500,000 copies and is RIAA certified Gold. Entertainment Weekly described it as being one of the top five key albums in the new prog genre.	Coheed and Cambria	Progressive Rock	2003
5	The Colour and the Shape	2800	/images/FooFighters.jpg	Standard Edition 120 gram 12"	The Colour and the Shape is the second studio album by American rock band Foo Fighters, released on May 20, 1997, by Roswell and Capitol Records. It marked the official debut of the Foo Fighters as a band. The band strived to create a full-fledged rock record, contrary to music press predictions that it would be another grunge offshoot.\nPrimarily inspired by Grohl's divorce from photographer Jennifer Youngblood in 1996, The Colour and the Shape is more lyrically introspective and musically developed than the Foo Fighters' debut. The album's track listing was designed to resemble a therapy session, splitting the album between uptempo tracks and ballads to reflect conflicting emotions. Early sessions at the Bear Creek studio in Washington went poorly and the band discarded most of those recordings. The band regrouped without Goldsmith in early 1997 to record at Hollywood's Grandmaster Recordings studio, with Grohl sitting in on drums instead. Goldsmith was offended and disgruntled that most of his material had been re-recorded, and he left the band shortly thereafter.	Foo Fighters	Alternative Rock	1997
6	Veckatimest	3400	/images/GrizzlyBear.jpg	Collector Edition 140 gram 12"	Veckatimest is the third studio album by the American indie rock band Grizzly Bear, released on May 26, 2009, on Warp Records. The album is named after Veckatimest Island, a small island in Dukes County, Massachusetts. Produced by bassist and multi-instrumentalist Chris Taylor, the album entered the US Billboard 200 at #8, selling 33,000 copies in its first week of release. By September 2012, the album had sold around 220,000 copies in the US. In 2010. It was awarded a gold certification from the Independent Music Companies Association which indicated sales of at least 100,000 copies throughout Europe.\nThe album was also included in the 2011 edition of the book 1001 Albums You Must Hear Before You Die.	Grizzly Bear	Indie Rock	2009
7	This is Happening	4500	/images/LCDSoundsystem.jpg	Limited Edition 180 gram 12"	This Is Happening is the third studio album by American rock band LCD Soundsystem. It was released first on May 17, 2010, jointly through DFA and Virgin Records in the United States and Parlophone elsewhere. It was recorded over the course of 2009 and early 2010 in the Mansion recording studio in Los Angeles. The first single, "Drunk Girls", was released in April 2010, with a music video directed by Spike Jonze. The album is dedicated to Jerry Fuchs (1974–2009), who performed drums live with the band on occasion, as well as having a big part in associated DFA acts.	LCD Soundsystem	Dance-punk	2010
9	Nilsson Schmilsson	3400	/images/Nilsson.jpg	Collector Edition 140 gram 12"	Nilsson Schmilsson is the seventh album by American singer Harry Nilsson, released by RCA Records in November 1971. It was Nilsson's most commercially successful work, producing three of his best-known songs. Among these was the number 1 hit "Without You", written by Pete Ham and Tom Evans of the group Badfinger. The album was the first of two Nilsson albums recorded in London and produced by Richard Perry.\n"Jump into the Fire" and "Coconut", both written by Nilsson, also became hits. The album performed well at the 1973 Grammy Awards, earning a nomination for Album of the Year, while "Without You" won the Grammy for Best Male Pop Vocal Performance. In 2006, Nilsson Schmilsson was ranked number 84 on Pitchfork's "Top 100 Albums of the 1970s".	Harry Nilsson	Rock	1971
10	Kid A	4200	/images/Radiohead.jpg	Colored Vinyl 180 gram 12"	Kid A is the fourth studio album by the English rock band Radiohead, released on 2 October 2000 by Parlophone. After the stress of promoting Radiohead's acclaimed 1997 album OK Computer, songwriter Thom Yorke envisioned a radical change in direction. The band incorporated synthesizers, drum machines, strings and brass, drawing influence from electronic music, ambient music, krautrock, jazz, and 20th-century classical music.\nRadiohead released no singles or music videos to promote Kid A and conducted few interviews and photoshoots. Instead, they became one of the first major acts to use the internet as a promotional tool; the album was made available to stream and was promoted with short animated films featuring music and artwork. Bootlegs of early performances were shared on file-sharing services, and the album was leaked before release.\nKid A debuted at the top of the charts in Britain, and became Radiohead's first number-one album in the United States; it has been certified platinum in Australia, Canada, France, Japan, the US and the UK.	Radiohead	Alternative Rock	2000
11	Sublime	3400	/images/Sublime.jpg	Collector Edition 140 gram 12"	Sublime is the third and final studio album by American ska punk band Sublime. Produced by Paul Leary and David Kahne, the album was released on July 30, 1996 in the United States by MCA Records.\nBy the time it came to record their major label debut, Nowell had been struggling with a heroin addiction. Sublime was recorded over a period of three months in Austin, Texas, in sessions characterized by heavy drug use and raucous partying. The album's musical style contains elements of punk rock, reggae, and ska, as well as dancehall, hip hop, and dub music, with tempos ranging wildly. Nowell's lyrical subject matter relates to relationships, prostitution, riots, and addiction.Bolstered by numerous hit singles, among them "What I Got", "Santeria", and "Wrong Way", the record proved enormously successful, despite the band being defunct and thus not promoting the album through touring. It sold over five million copies in the United States by the end of the decade, and it continues to be a popular catalog album. The album ushered in third wave ska, and etched Sublime into a permanent place among the stars of 1990s alternative rock.	Sublime	Ska Punk	1996
12	Tenacious D	4500	/images/TenaciousD.jpg	Limited Edition 180 gram 12"	Tenacious D is the first studio album by American comedy rock band Tenacious D, released on September 25, 2001 by Epic Records. The album's polished production was a departure from the band's acoustic origins, due in part to the production of the Dust Brothers.\nFor their first album, they enlisted the help of drummer Dave Grohl, keyboardist Page McConnell of Phish, guitarist Warren Fitzgerald, and bass player Steven Shane McDonald. The Dust Brothers produced the album. The majority of the songs on their debut album stem from early versions as seen on their HBO TV series, Tenacious D. The record itself does not list the song titles on the back cover as is the convention but instead on the back cover of the jacket. This is perhaps to allow songs with expletives or words otherwise deemed offensive to escape censorship or omission.	Tenacious D	Comedy Rock	2001
13	Third Eye Blind	2800	/images/ThirdEyeBlind.jpg	Standard Edition 120 gram 12"	Third Eye Blind is the debut studio album by American rock band Third Eye Blind. It was released on March 26, 1997 by Elektra Records. The album spawned five singles, including the top ten chart hits "Semi-Charmed Life", "Jumper", and "How's It Going to Be".\nCritical reception to Third Eye Blind was generally positive. Stephen Thomas Erlewine of AllMusic described Third Eye Blind as "easy on the ears," stating that "its straight-ahead professionalism makes it a pleasurable listen for post-grungers". David Grad of Entertainment Weekly described the album as "balancing a cheery ear for harmonies with a finely honed sense of despair".\nThird Eye Blind debuted at number 135 on the US Billboard 200 in its first week. The album rose to number 25 on March 28, 1998, spending a total of 106 weeks on the chart. On August 31, 2001, the album was certified 6x Platinum in the United States.	Third Eye Blind	Alternative Rock	1997
14	Weezer (Blue Album)	3400	/images/WeezerWeezer.jpg	Collector Edition 140 gram 12"	Weezer (commonly known as the Blue Album) is the eponymous debut studio album by American rock band Weezer, released on May 10, 1994 by DGC Records. The album came two years after the band's founding, after they initially struggled as an alternative to grunge music, which was prevalent in Los Angeles during the early 1990s. It was almost entirely arranged and composed by frontman Rivers Cuomo, who also anticipated to lead the band in self-producing the album. However, at the behest of DGC, the band was required to include a producer, and collectively opted for Cars frontman Ric Ocasek.\nUnder Ocasek's direction, the band opted for a brighter sound, while bassist Matt Sharp collaborated with Cuomo to ensure that the album contained an overriding sonic concept of treating the guitars and bass as isolated ten-string instruments, thus maximizing its potential when united. Lyrically, Weezer focuses on outsiderdom and social awkwardness, while also touching on melancholic themes of love, romance, and familial issues.	Weezer	Alternative Rock	1994
15	Pet Sounds	4200	/images/BeachBoys.jpg	Colored Vinyl 180 gram 12"	Pet Sounds is the eleventh studio album by the American rock band the Beach Boys, released May 16, 1966 on Capitol Records. It initially met with a lukewarm critical and commercial response in the United States, peaking at number 10 on Billboard Top LPs chart, lower than the band's preceding albums. Promoted as "the most progressive pop album ever", Pet Sounds attracted recognition for its ambitious recording and sophisticated music. It is widely considered to be among the most influential albums in the history of music.\nThe album was produced, arranged, and almost entirely composed by Brian Wilson with guest lyricist Tony Asher. His goal was to create "the greatest rock album ever made"—a cohesive work with no filler tracks. It is sometimes considered a Wilson solo album.\nPet Sounds is regarded by musicologists as an early concept album that advanced the field of music production, introducing non-standard harmonies and timbres, and incorporating elements of pop, jazz, exotica, classical, and the avant-garde. The album could not be replicated live and was the first time a group departed from the usual small-ensemble electric rock band format for a whole LP. Combined with its innovative music, which was perceived as a wholly self-conscious artistic statement (or "concept"), the record furthered the cultural legitimization of popular music, was crucial to the development of progressive/art rock, and helped bring psychedelic music to the mainstream.	The Beach Boys	Progressive Pop	1966
16	Before Today	3400	/images/ArielPink.jpg	Collector Edition 140 gram 12"	Before Today is the eighth studio album by American recording artist Ariel Pink, credited to "Ariel Pink's Haunted Graffiti", and released on June 8, 2010. The album marked Pink's debut on the record label 4AD. It was his first official LP of new recordings since 2003's Worn Copy and his first written and recorded with a supporting band, referred to in the liner notes as "Ariel Pink's Haunted Graffiti".\nThe album was critically acclaimed upon release, with Pitchfork placing the album at #9 on its list of "The Top 50 Albums of 2010". Lead single "Round and Round" was also ranked by Pitchfork as the best track of 2010.	Ariel Pink's Haunted Graffiti	Indie Rock	2010
17	Deja Entendu	2800	/images/BrandNew.jpg	Standard Edition 120 gram 12"	Deja Entendu is the second studio album by American rock band Brand New, released in 2003. It was widely praised for showing the band's maturation from their debut Your Favorite Weapon. The album's title is French for "already heard". Two singles and videos were released from the album: "The Quiet Things That No One Ever Knows" and "Sic Transit Gloria...Glory Fades". The album received very positive reviews and has since been placed on numerous lists as one of the greatest albums of the decade and from the emo genre.\nSeveral of the song titles reference films. The first track entitled "Tautou" references the lead actress, Audrey Tautou, in the movie Amélie. "Okay I Believe You, But My Tommy Gun Don't" is a line from Home Alone 2: Lost in New York, and "Sic Transit Gloria...Glory Fades" is a quote from Wes Anderson's film Rushmore.	Brand New	Emo	2003
18	The Shape of Punk to Come	3400	/Images/Refused.jpg	Collector Edition 140 gram 12"	The Shape of Punk to Come: A Chimerical Bombination in 12 Bursts, often shortened to The Shape of Punk to Come, is the third album by Swedish hardcore punk band Refused, released on October 27, 1998 through Burning Heart Records.\nAlthough Refused broke up only months after the album's release, The Shape of Punk to Come has since found an audience for the band and largely contributed to their posthumous fame, as well as inspiring many later artists in a wide range of genres. Kerrang! magazine listed The Shape of Punk to Come at #13 on their 50 Most Influential Albums of All Time list in 2003.\nThis album marked a sharp and conscious departure from Refuseds earlier work. The philosophy of the album, expounded in the ample liner notes and encapsulated in the song "New Noise", was that punk and hardcore music could not be anti-establishment by continuing to package revolutionary lyrics in sounds which had been increasingly co-opted into the mainstream. The sound of the record challenged existing punk sensibilities; it can be seen as "punk" at a fundamental level and includes experimental combinations of post-hardcore, post-punk, techno, and jazz sounds.	Refused	Hardcore Punk	1998
23	Paul's Boutique	4200	/images/BeastieBoys.jpg	Colored Vinyl 180 gram 12"	Paul's Boutique is the second studio album by American hip hop group Beastie Boys, released on July 25, 1989 by Capitol Records. Produced by the Dust Brothers, the album is composed almost entirely from samples, and was recorded over two years at Matt Dike's apartment and the Record Plant in Los Angeles.\nPaul's Boutique did not match the sales of group's 1986 debut Licensed to Ill, and was promoted minimally by Capitol. However, it became recognized as the group's breakthrough achievement, with its innovative lyrical and sonic style earning them a position as critical favorites within the hip-hop community. Sometimes described as the "Sgt. Pepper of hip-hop", Paul's Boutique has since been placed on several lists of the greatest albums of all time, and is viewed by many critics as a landmark album in hip hop.	Beastie Boys	Hip Hop	1989
8	Ruin Jonny's Bar Mitzvah	3400	/images/MeFirst.jpg	Collector Edition 140 gram 12"	Ruin Jonny's Bar Mitzvah is a live album by Me First and the Gimme Gimmes, released on October 19, 2004, on Fat Wreck Chords.\nIt was recorded live at an actual bar mitzvah party, and its runtime lasts their entire performance, including a break in which little can be heard other than the sounds of party guests wandering around and chatting amongst themselves. Jonny Wixen, the Bar Mitzvah boy, plays drums on one of the hidden tracks that are on the final track. The CD comes with footage of the bar mitzvah.\nThe album is almost entirely made up of songs that have not appeared on previous albums. The only exceptions are two hidden tracks: "Seasons in the Sun" from Have a Ball (1997) and "Sloop John B" from Blow in the Wind (2001).	Me First and the Gimme Gimmes	Punk Rock	2004
19	Gimme Fiction	4500	/images/Spoon.jpg	Limited Edition 180 gram 12"	Gimme Fiction is the fifth studio album by American indie rock band Spoon. It was released on May 10, 2005, through Merge Records in the US and Matador Records in Europe. It debuted at number 44 on the Billboard 200. "I Turn My Camera On" was released as a single, and has become one of the band's biggest hits to date.\nGimme Fiction received widespread critical acclaim upon release. At Metacritic, which assigns a normalized rating out of 100 to reviews from mainstream critics, the album received an average score of 84, based on 30 reviews which indicates "universal acclaim". Eric Carr of Pitchfork praised the album's musical diversity and cited "I Turn My Camera On" as one of the most "breathtaking" songs the band had ever produced. Zeth Lundy of PopMatters named the album the band's "crowning achievement", while Jesus Chigley of Drowned in Sound described it as "a nocturnal, introspective refinement of previous releases that still capitalizes on Britt Daniel's classic pop song writing and sonic inventiveness."\nIn a 2005 back page column for the magazine Entertainment Weekly, author Stephen King named "I Summon You" as his favorite song of the year.	Spoon	Indie Rock	2005
20	White Pony	3400	/images/Deftones.jpg	Collector Edition 140 gram 12"	White Pony is the third studio album by American alternative metal band Deftones, released on June 20, 2000 by Maverick Records. It marked a significant growth in the band's sound and is considered a turning point in their history in terms of experimentation, employing an increasingly experimental rock sound and incorporating influences from new wave, dream pop, trip hop, shoegaze, and post-rock into the alternative metal sound they had become known for. White Pony was also the first album to feature Frank Delgado as a full-time member of the band on turntables and synthesizer; Delgado had previously worked with the band as a featured guest on Around the Fur (1997) and Adrenaline (1995), producing sound effects on some songs. It was also the first Deftones record which Chino Moreno began to contribute rhythm guitar parts.\nUpon its release and retrospectively, the album was met with critical acclaim, and is generally regarded by fans and critics alike as one of their most mature outings up to that point. White Pony is Deftones' highest-selling album to date, and was certified platinum by the RIAA on July 17, 2002. The album includes two successful singles ("Change (In the House of Flies)" and "Back to School (Mini Maggit)"), the promotional single "Digital Bath," as well as the 2001 Grammy Award-winning track for Best Metal Performance, "Elite".	Deftones	Alternative Metal	2000
21	Boxer	4200	/images/TheNational.jpg	Colored Vinyl 180 gram 12"	Boxer is the fourth studio album by American indie rock band The National, released on May 22, 2007 on Beggars Banquet Records. Produced by both Peter Katis and the band itself, the album has sold nearly 430,000 copies in the U.S. Following its release, the album debuted at #68 on the U.S. Billboard 200, selling about 9,500 copies in its first week.\nBoxer has made numerous "albums of the decade" lists including Pitchfork, Aquarium Drunkard, and Paste. In 2019, the album was ranked 68th on The Guardian's 100 Best Albums of the 21st Century list.	The National	Indie Rock	2007
22	Friend and Foe	2800	/images/Menomena.jpg	Standard Edition 120 gram 12"	Portland, Ore., trio Menomena blasted out of the indie rock netherworld with 2004's ecstatic I Am the Fun Blame Monster! The band's m.o. is direct from the future: Multi-instrumentalist Brent Knopf created looping software Deeler, which forms the basis for all Menomena tracks. Now with their second LP, Friend and Foe, the trio hones its craft, mixing experimentation with David Byrne-like songwriting and jarring yet cohesive structure.\nOpener "Muscle'n Flo" segues from Blame Monster without breaking a sweat and flows into bombastic and angry "The Pelican." The electronic inspiration shines in "Air Aid," a futuristic ode to violence and love, which slips into the keyboard blast of "Weird," every song seamlessly dabbling into the next. No filler, not one outtake, Friend and Foe succeeds in living up to the hype of Menomena's first LP by growing wiser with every loop of sax and blast.	Menomena	Indie Rock	2007
24	Making Friends	4500	/images/NUFAN.jpg	Limited Edition 180 gram 12"	Making Friends works because it has many elements of pop-punk that are tried and true, but more so because their older self bleeds through many of their songs and adds an edge to what would otherwise be mediocre. It's not a remarkably consistent album though many of the song themes flow into the next. The lack of consistency can be attributed to an exploration of style and overall rhythm, which is guitar driven, and results in an experimental side that takes from consistency what it gives to noticeable accessibility and catchiness.\nTo date, NUFAN has achieved enough success and credibility to release a solid collection of greatest hits. Thanks to Chris Shiflett of the Foo Fighters, they became more than another pop-punk band, or another NOFX clone, or even a Pennywise.	No Use for a Name	Punk Rock	1997
\.


--
-- Name: cartItems_cartItemId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."cartItems_cartItemId_seq"', 67, true);


--
-- Name: carts_cartId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."carts_cartId_seq"', 28, true);


--
-- Name: orders_orderId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."orders_orderId_seq"', 10, true);


--
-- Name: products_productId_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public."products_productId_seq"', 1, false);


--
-- Name: cartItems cartItems_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public."cartItems"
    ADD CONSTRAINT "cartItems_pkey" PRIMARY KEY ("cartItemId");


--
-- Name: carts carts_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.carts
    ADD CONSTRAINT carts_pkey PRIMARY KEY ("cartId");


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY ("orderId");


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY ("productId");


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: -
--

GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

