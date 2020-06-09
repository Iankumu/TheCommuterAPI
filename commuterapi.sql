-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 08, 2020 at 12:00 PM
-- Server version: 10.1.39-MariaDB
-- PHP Version: 7.3.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `commuterapi`
--

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2016_06_01_000001_create_oauth_auth_codes_table', 1),
(4, '2016_06_01_000002_create_oauth_access_tokens_table', 1),
(5, '2016_06_01_000003_create_oauth_refresh_tokens_table', 1),
(6, '2016_06_01_000004_create_oauth_clients_table', 1),
(7, '2016_06_01_000005_create_oauth_personal_access_clients_table', 1),
(8, '2019_08_19_000000_create_failed_jobs_table', 1),
(9, '2020_05_08_111337_create_tasks_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `oauth_access_tokens`
--

CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_access_tokens`
--

INSERT INTO `oauth_access_tokens` (`id`, `user_id`, `client_id`, `name`, `scopes`, `revoked`, `created_at`, `updated_at`, `expires_at`) VALUES
('0119c9367a9e4473eb4331b546142aac939a21dbb94a966d36261f7f8144e00dd7a747ea1e2cf3ac', 1, 1, 'authToken', '[]', 0, '2020-05-12 16:32:09', '2020-05-12 16:32:09', '2021-05-12 19:32:09'),
('05a7a93b154a4e2fb133017e65ecac76451c5663a912d13bd833f68b0b3a7328084da267c985e034', 1, 1, 'authToken', '[]', 0, '2020-05-10 11:21:41', '2020-05-10 11:21:41', '2021-05-10 14:21:41'),
('07ba763c79829a4b03c97d12cc442f6b098816d5033f65a95b53bb44728fa69245c2cd316fce3420', 1, 1, 'authToken', '[]', 0, '2020-05-15 14:22:59', '2020-05-15 14:22:59', '2021-05-15 17:22:59'),
('0951387f9d33d31a3c4507eb65fe98b4090c241ae8c7380352840e25628315c4348c0c34920c53e1', 1, 1, 'authToken', '[]', 0, '2020-05-16 13:16:02', '2020-05-16 13:16:02', '2021-05-16 16:16:02'),
('0c6756d54d08805316aa8f47ab5ccd595c899938f8fa8ba10d880416169bf45c5000fabf555a40cc', 1, 1, 'authToken', '[]', 0, '2020-05-12 13:57:58', '2020-05-12 13:57:58', '2021-05-12 16:57:58'),
('0d303a1ad42e2542f356fc68c8a1bf46547f183bcb6e86ae149a5a91460a3f5489dbae969e014645', 1, 1, 'authToken', '[]', 0, '2020-05-12 15:32:00', '2020-05-12 15:32:00', '2021-05-12 18:32:00'),
('0d8d100ff05ed7f7c6e851a0200b5b3d392ebd7a63c3e45013475d8b1de96483428528d191c7d314', 1, 1, 'authToken', '[]', 0, '2020-05-16 13:32:34', '2020-05-16 13:32:34', '2021-05-16 16:32:34'),
('15927e789206a93c5c3c4984cbd08d6e97819bd80c02952738df07d36d1363784e31697ddde35ab7', 1, 1, 'authToken', '[]', 0, '2020-05-15 13:37:07', '2020-05-15 13:37:07', '2021-05-15 16:37:07'),
('163bc633bddd72818bb00d860398a0f64f24d89f2ae7f724fee3971b8f8ec2df929dc16bd5b35e13', 7, 1, 'authToken', '[]', 0, '2020-05-16 15:26:38', '2020-05-16 15:26:38', '2021-05-16 18:26:38'),
('16f8df29bc60f52ea5b75b468d62c25c2201d8590bb26e860a76ff31aa9be5f44d6f1945ad2dbd31', 1, 1, 'authToken', '[]', 0, '2020-05-16 08:07:11', '2020-05-16 08:07:11', '2021-05-16 11:07:11'),
('19dd7599709de4f1a0fdd8d0c0ec03247671213505afb0f59c8a2332d7abe594541f39eb67f3e436', 1, 1, 'authToken', '[]', 0, '2020-05-15 13:36:58', '2020-05-15 13:36:58', '2021-05-15 16:36:58'),
('1d09f2a601daec92f7b4c2303de66290408133eb937ecf21c59f9e07e33b914e2f262a0018b0ffa5', 1, 1, 'authToken', '[]', 0, '2020-06-06 05:23:32', '2020-06-06 05:23:32', '2021-06-06 08:23:32'),
('1f392fbbf82aa88a8772627fa031989a816fd90049dd3fc1283e9d1450875e7d881c3e8bcaa65be1', 9, 1, 'authToken', '[]', 0, '2020-05-16 15:52:36', '2020-05-16 15:52:36', '2021-05-16 18:52:36'),
('2042171ce356ab41c0805c88351673b9101cb81af526fed50193d65a02a4bf1863f2efb164aea2a8', 1, 1, 'authToken', '[]', 0, '2020-05-16 08:05:26', '2020-05-16 08:05:26', '2021-05-16 11:05:26'),
('22df7c8f607486dbc392e705227dada4f2e255f424d503fb90a48208687a56096973c6d35bf4543d', 1, 1, 'authToken', '[]', 0, '2020-05-08 08:47:47', '2020-05-08 08:47:47', '2021-05-08 11:47:47'),
('23f5febca3f8398efac13f7937820024bc2a6894b07c3233143b89a303a2d6e59c43b06074cb52c1', 1, 1, 'authToken', '[]', 0, '2020-05-12 13:57:49', '2020-05-12 13:57:49', '2021-05-12 16:57:49'),
('24875756c57206fd2388ac40385e06faeb914f793eca46f3ca70f6606124d2f270f01993a935cfd6', 1, 1, 'authToken', '[]', 0, '2020-05-15 14:12:48', '2020-05-15 14:12:48', '2021-05-15 17:12:48'),
('2b656cdbaaf07c607a6a854976366c4cbcf253f79380ed32c89ebf81bb47692f3d3b1f0ca1cb00e5', 1, 1, 'authToken', '[]', 0, '2020-05-16 13:39:54', '2020-05-16 13:39:54', '2021-05-16 16:39:54'),
('2edc284f017126a01805235a11788d14691eff35629f2815e21388c81fef5b01b2e611f3294a4a7f', 1, 1, 'authToken', '[]', 0, '2020-05-16 13:33:47', '2020-05-16 13:33:47', '2021-05-16 16:33:47'),
('2f6bc06f659630f38003375afda6605dfadb508f921a3a9b2fb62db74b159911f77d41e279cbd8b5', 1, 1, 'authToken', '[]', 0, '2020-05-12 16:19:34', '2020-05-12 16:19:34', '2021-05-12 19:19:34'),
('3030333c9fdace889d315894c5a4b851ae1cdcb48498d6cf8c165c1940dfaf866d858f1f7e7132d3', 1, 1, 'authToken', '[]', 0, '2020-05-15 14:54:03', '2020-05-15 14:54:03', '2021-05-15 17:54:03'),
('31262be02f1b8bd8e75866c002d7d08cb90dddc64bd75abb4c16e3c67ab143bd02fd62c1fa81e79f', 1, 1, 'authToken', '[]', 0, '2020-05-16 14:19:26', '2020-05-16 14:19:26', '2021-05-16 17:19:26'),
('326d782e60d39c1bf9b7ec673ffaaa9f444f5cf3e094d01c9b1f99b6d95b7a5732774a38075a610c', 1, 1, 'authToken', '[]', 0, '2020-05-12 13:57:59', '2020-05-12 13:57:59', '2021-05-12 16:57:59'),
('333736250a2c489baddaaca9beb158bf752dd56554496c6e481b59b2ff6e36cc5c1ac0cfe8b776df', 1, 1, 'authToken', '[]', 0, '2020-05-16 13:27:59', '2020-05-16 13:27:59', '2021-05-16 16:27:59'),
('3416bdc3ed46c489c5ae82291aec9c442852b3c7e70172c5074ed9a528f4201a6065e4dbf27284dc', 1, 1, 'authToken', '[]', 0, '2020-05-12 16:00:02', '2020-05-12 16:00:02', '2021-05-12 19:00:02'),
('356b36958dc9637c71c6826c9311e44d0cecc11eae0cf104f94b565006b3f8417640cb3d967d96af', 1, 1, 'authToken', '[]', 0, '2020-06-06 06:22:35', '2020-06-06 06:22:35', '2021-06-06 09:22:35'),
('3635599ee99c158b1cb5a9d43ed50325a98af9c57a6a42be71dac492367ac020f1da3547740af898', 1, 1, 'authToken', '[]', 0, '2020-05-16 13:55:57', '2020-05-16 13:55:57', '2021-05-16 16:55:57'),
('365308039c6f5d697bffe83edf9139148f779cfb300c6bec3a4fa07cff34a1359f1999a2282d7189', 1, 1, 'authToken', '[]', 0, '2020-05-15 14:08:29', '2020-05-15 14:08:29', '2021-05-15 17:08:29'),
('38ff736d84bc201435a415c66a7ec86d86f294abdb8ec79907d004b65aaeacf43099fae57ffb1770', 1, 1, 'authToken', '[]', 0, '2020-05-12 13:58:02', '2020-05-12 13:58:02', '2021-05-12 16:58:02'),
('390a376c0654072812d4f3b05366cf1cf58b8d0f1963a5d53fa28ce1d309f9910dd09ced3f3c6c3e', 1, 1, 'authToken', '[]', 0, '2020-05-16 04:33:44', '2020-05-16 04:33:44', '2021-05-16 07:33:44'),
('3b25e28ba6f498b20a2e37fbb867af108904faeeced6d5941a90788694db640e0d2d2361fd0d585e', 1, 1, 'authToken', '[]', 0, '2020-05-10 11:11:54', '2020-05-10 11:11:54', '2021-05-10 14:11:54'),
('3c750e17d23ae435bb08378fbfb79b23ef3847eb3f71a1121a550eec60fdc4e9f837a6faee3e8b71', 1, 1, 'authToken', '[]', 0, '2020-05-12 16:42:13', '2020-05-12 16:42:13', '2021-05-12 19:42:13'),
('3d30ef5362a75e91edd6d6dbb501e79ead08a216db6bbcf34b7aa62bddd8a0c45bc671b7c0a32ea8', 1, 1, 'authToken', '[]', 0, '2020-05-12 15:50:55', '2020-05-12 15:50:55', '2021-05-12 18:50:55'),
('3de6a494926cd8a36256c667a4f25d5f9d80b7274152ff07e53b9d9b7d9de07efe8ad224a44ba057', 1, 1, 'authToken', '[]', 0, '2020-05-16 09:42:38', '2020-05-16 09:42:38', '2021-05-16 12:42:38'),
('3ebf1b4cff7c21f6c55e09a8a1acd5fcf43e515120597e02094ac000c9fdf0f38ffd4a8d0baaa4c9', 1, 1, 'authToken', '[]', 0, '2020-05-12 16:32:11', '2020-05-12 16:32:11', '2021-05-12 19:32:11'),
('3f754848257bc2ac51403f7ceb95d93be16104f84e3e621c20d0f68a02b2668592d11604aef5df01', 1, 1, 'authToken', '[]', 0, '2020-05-16 13:52:57', '2020-05-16 13:52:57', '2021-05-16 16:52:57'),
('45729df46d2d6da063de91c78ee057ac65b11a60b5bd9cfaba2e483ae8b79a2d49abb3450f8cdb1f', 1, 1, 'authToken', '[]', 0, '2020-05-15 15:08:02', '2020-05-15 15:08:02', '2021-05-15 18:08:02'),
('459a734f77ff333b2223f98337deb30150fcdc5f41a07aea913a863c065295266bdc440761b9b1e0', 1, 1, 'authToken', '[]', 0, '2020-05-16 14:00:45', '2020-05-16 14:00:45', '2021-05-16 17:00:45'),
('4809ebd691e3a38dd64a5273a432bc2586f9db730d54db408abae6298561afc28273a3b37506ef97', 1, 1, 'authToken', '[]', 0, '2020-05-16 08:08:56', '2020-05-16 08:08:56', '2021-05-16 11:08:56'),
('48fdc7804c2eca002a64b553909d3b6a570374711b9910c9608a21d144995dfee90df1137449ef92', 1, 1, 'authToken', '[]', 0, '2020-05-12 15:20:52', '2020-05-12 15:20:52', '2021-05-12 18:20:52'),
('4adf2b79d724f9c261bbfd152ed46729bfad3a581417cfb06a114b70aead153f019aaf1dae7fcad4', 1, 1, 'authToken', '[]', 0, '2020-05-12 13:57:56', '2020-05-12 13:57:56', '2021-05-12 16:57:56'),
('4b999d2e7da3d0864e6ab0f1c0d5a0b0240d44741930c8aba1fcb651be1d40ac6dbd16b280ca3652', 1, 1, 'authToken', '[]', 0, '2020-05-31 11:42:33', '2020-05-31 11:42:33', '2021-05-31 14:42:33'),
('5041e4fe50b7170c42ff0c904bd24c1ae5d25f61b91d576417b1525b362a616286053f451a13d4d7', 1, 1, 'authToken', '[]', 0, '2020-05-16 08:26:05', '2020-05-16 08:26:05', '2021-05-16 11:26:05'),
('526e7ab392391cf23d0894fbaa909e9bcdc6ed4e45c9797b64df4f983176f8531d0cd7fc58f684f7', 1, 1, 'authToken', '[]', 0, '2020-05-16 08:19:13', '2020-05-16 08:19:13', '2021-05-16 11:19:13'),
('56c6a34edb9a1c662607dfa4fb1ec4707c500ca6ca41760fe16dde9375d0329ed3daf97949c64b79', 5, 1, 'authToken', '[]', 0, '2020-05-16 06:14:42', '2020-05-16 06:14:42', '2021-05-16 09:14:42'),
('57db3ba957a1a6e82bab8d47a9c264f191e90aa5c1afb9ac626f7c547879324fa09b1268c1bf37c5', 1, 1, 'authToken', '[]', 0, '2020-05-15 14:29:57', '2020-05-15 14:29:57', '2021-05-15 17:29:57'),
('5aed3e201f236c95b3db27438cfc4b8741d053c5e737ac3a09f5ebf60e323b1494b0841bc04b18fe', 1, 1, 'authToken', '[]', 0, '2020-05-16 12:54:00', '2020-05-16 12:54:00', '2021-05-16 15:54:00'),
('5c5e2aab6ba1badfa03be739765aa38e940f1c476cc54b1b727bac3acece45c4839f25cbff144af2', 1, 1, 'authToken', '[]', 0, '2020-05-16 13:34:47', '2020-05-16 13:34:47', '2021-05-16 16:34:47'),
('5d5504a164fdae07c907384c3db0392bb514a81fa737c040ef4d34887f79887004feb08a4caedfb9', 1, 1, 'authToken', '[]', 0, '2020-06-06 05:04:54', '2020-06-06 05:04:54', '2021-06-06 08:04:54'),
('6069fab92083920f056010c82115eefc59e03396f4dc970c96f6c0ce6385b023afa4a1a8e0d5a6cd', 1, 1, 'authToken', '[]', 0, '2020-05-12 13:58:04', '2020-05-12 13:58:04', '2021-05-12 16:58:04'),
('60b78b2a976c88db7daa12fc5983888f3892aea22b0502226f66cee0c54cf4330619dccab5a9f29d', 1, 1, 'authToken', '[]', 0, '2020-05-16 13:30:06', '2020-05-16 13:30:06', '2021-05-16 16:30:06'),
('62319c7136ee1d71cfa398acf7843e16ad4f4e464b940857976ad150fa987bc7ac2fde74c846502b', 1, 1, 'authToken', '[]', 0, '2020-05-16 06:23:31', '2020-05-16 06:23:31', '2021-05-16 09:23:31'),
('641bc0b8e089cfa39ce427de38854f3eebba015a233f6150d96251d1a41d199ada898d8fcc75a940', 1, 1, 'authToken', '[]', 0, '2020-05-16 07:52:24', '2020-05-16 07:52:24', '2021-05-16 10:52:24'),
('6690001530ddbfa51f4bdc7168f903f8921d787d2f6c09b1eb01d7c6bdaf5c6bc32dbf962e9b629a', 1, 1, 'authToken', '[]', 0, '2020-05-16 12:54:41', '2020-05-16 12:54:41', '2021-05-16 15:54:41'),
('681c437be05671b005d902661163d095dbe3f92e0f461f85ca4f8ee3e21466cab4a0b577e5fbc97e', 4, 1, 'authToken', '[]', 0, '2020-05-10 10:15:29', '2020-05-10 10:15:29', '2021-05-10 13:15:29'),
('692a30deeb91c2f3c8770674bf7af03f3319aa41dd587093be5a6cb4e9fe991e1b6a4f58731e6011', 1, 1, 'authToken', '[]', 0, '2020-05-15 14:26:19', '2020-05-15 14:26:19', '2021-05-15 17:26:19'),
('69f32b5e457d22e8af8cbcdd221f59e007f22eeba6cce28b7edbdad5e1b6b11556dec1f8cedf23b5', 1, 1, 'authToken', '[]', 0, '2020-05-16 15:00:26', '2020-05-16 15:00:26', '2021-05-16 18:00:26'),
('6a784d3ef9d4fcc83b9fa07fe9ed72c77a151d8395e23d9814a8ee7e3edaa204a8c601a411494652', 1, 1, 'authToken', '[]', 0, '2020-05-12 16:06:24', '2020-05-12 16:06:24', '2021-05-12 19:06:24'),
('6c257dc5403a3c1f89392db5fbd7388896495eedf33f27701134c20bff3dcb851d71c9c7bc319304', 1, 1, 'authToken', '[]', 0, '2020-05-16 09:38:46', '2020-05-16 09:38:46', '2021-05-16 12:38:46'),
('6ce1716715c7347ea14b0e330bef85744398694cc72f140de9902a603e252c345b78d1eb2d296a0e', 1, 1, 'authToken', '[]', 0, '2020-05-10 11:20:32', '2020-05-10 11:20:32', '2021-05-10 14:20:32'),
('6d6681fed2e4e6a53af59e6f9af03709684986720c40d92238f5c99d09d3cc4e2fad7a41e7b2ce69', 1, 1, 'authToken', '[]', 0, '2020-05-16 07:54:30', '2020-05-16 07:54:30', '2021-05-16 10:54:30'),
('6e3b8c4f95a31ec2930f2c50e73eb46846071e1372e0172fb3e7e6d233dc8cef1ac05be710b27541', 1, 1, 'authToken', '[]', 0, '2020-05-12 16:09:09', '2020-05-12 16:09:09', '2021-05-12 19:09:09'),
('7022ddb912b66761724398862b81f863f731bcc8b7f95c401c594ee684159acd47ef4117d3b8d149', 1, 1, 'authToken', '[]', 0, '2020-05-12 15:30:18', '2020-05-12 15:30:18', '2021-05-12 18:30:18'),
('736417f34eb13aaa98c6f22864de9e12d59a706ddb96f443f923d779dbbe0449e2d15eb4626ff401', 1, 1, 'authToken', '[]', 0, '2020-05-16 14:28:49', '2020-05-16 14:28:49', '2021-05-16 17:28:49'),
('7550beb6e210f288696d8aecf5b82aa79394729cd9a37067b9dd532617ba5d7b626022d442019d47', 1, 1, 'authToken', '[]', 0, '2020-05-16 13:07:17', '2020-05-16 13:07:17', '2021-05-16 16:07:17'),
('7a795aa1185cd79b8a752c0a9cd20ba3491f8b35190c395564249c190fb5c1a3a4a38843dd8349b5', 1, 1, 'authToken', '[]', 0, '2020-05-16 13:33:48', '2020-05-16 13:33:48', '2021-05-16 16:33:48'),
('7ddc9d26361518a8ece5f218021dc381f97ec593460761bad7542f5fbb5ee9b36701d697f2a3a9c6', 1, 1, 'authToken', '[]', 0, '2020-05-10 11:30:00', '2020-05-10 11:30:00', '2021-05-10 14:30:00'),
('7e14696fdac5c1e3096fd808c3ecd5edae13144806907278fc7f3fbb414f60b4748b732f157620b0', 1, 1, 'authToken', '[]', 0, '2020-05-12 15:41:30', '2020-05-12 15:41:30', '2021-05-12 18:41:30'),
('8126071ce3e114722217613d3bc9e736e362bf7b846759acbf60e67ca45e40d3c1ac360e9232ae7c', 1, 1, 'authToken', '[]', 0, '2020-05-12 13:58:00', '2020-05-12 13:58:00', '2021-05-12 16:58:00'),
('83a079d094e6e9fc614c4aad4a724f6db29ca3ba9ed4e5e7fd20ad0c5447faec60b85460b8df05cf', 1, 1, 'authToken', '[]', 0, '2020-05-15 13:58:15', '2020-05-15 13:58:15', '2021-05-15 16:58:15'),
('83da3c7cdb466e783bae76a956cb1ef2330828eb9f13f8fbe7b89d174d854ee63a3e16717ded0233', 1, 1, 'authToken', '[]', 0, '2020-05-16 08:16:51', '2020-05-16 08:16:51', '2021-05-16 11:16:51'),
('881c8887211b2d8cfd17b6d16b4917ddb2679e1ed59391289f9a577a49315fb4f3332c827267ec51', 1, 1, 'authToken', '[]', 0, '2020-05-10 10:31:34', '2020-05-10 10:31:34', '2021-05-10 13:31:34'),
('896c4c05902d01effa28eb03b4a264a5f20b29a7061525ea7d678203a1287271417c22c15ab95e02', 1, 1, 'authToken', '[]', 0, '2020-05-12 15:45:59', '2020-05-12 15:45:59', '2021-05-12 18:45:59'),
('8a77f7b93e8f0c2abf47dc2b9ac55ebe3cad835c44b76d18ab4042db96c6050e1c89892ad7787606', 1, 1, 'authToken', '[]', 0, '2020-05-16 13:58:41', '2020-05-16 13:58:41', '2021-05-16 16:58:41'),
('8d5ac3153258ec398548b735c22fef01e744bc13a0628b4a97e172ed82275e0e24109d870c77adf8', 1, 1, 'authToken', '[]', 0, '2020-05-12 16:33:43', '2020-05-12 16:33:43', '2021-05-12 19:33:43'),
('921167a29725b5e9e5cc66b6c041697b591aff7815e5ddb9904b0ebbaab9cff4b7d78e51fb9d0897', 1, 1, 'authToken', '[]', 0, '2020-06-08 06:42:01', '2020-06-08 06:42:01', '2021-06-08 09:42:01'),
('9225f51882207ba01298062e2c42493143b722e7eef33a8f3eb1aee58ef37028594579bdb9827496', 1, 1, 'authToken', '[]', 0, '2020-05-12 13:57:57', '2020-05-12 13:57:57', '2021-05-12 16:57:57'),
('93fb22d763350cf63731b4ad61fa38522b8e1c000f0c70f916a9e0ce8ba1a3b8566118294d3f508d', 1, 1, 'authToken', '[]', 0, '2020-05-12 16:33:43', '2020-05-12 16:33:43', '2021-05-12 19:33:43'),
('963fb97e86c41dab98110a3fdc1a5086a744ff3a3b5ccdc65eb2fd2760674a2288c59d4d80ef9d46', 1, 1, 'authToken', '[]', 0, '2020-05-16 04:05:00', '2020-05-16 04:05:00', '2021-05-16 07:05:00'),
('9d5d84cfd97e6c6ecb85192d4a4beda2bf4f566a0f7852f5a754f8e0d2806f68bfdfa995c233bd37', 1, 1, 'authToken', '[]', 0, '2020-05-16 14:26:48', '2020-05-16 14:26:48', '2021-05-16 17:26:48'),
('9d5e8431632a2f001d8c84d8d132a3adc7d9686489fcdfdb3aca881f828b91a0db4394f69352a8ac', 1, 1, 'authToken', '[]', 0, '2020-05-12 16:32:10', '2020-05-12 16:32:10', '2021-05-12 19:32:10'),
('a47c283ef501aedc7b35da68dd7def211cab54bf6a55b7c3f365c20baf116ae87a1aa094c5071fa9', 1, 1, 'authToken', '[]', 0, '2020-05-16 13:05:31', '2020-05-16 13:05:31', '2021-05-16 16:05:31'),
('a5bdf1ee8715fc494455fe15ab5b868e8c01e52af7c8d319f9f9a3c451f48df83756917ab978de22', 1, 1, 'authToken', '[]', 0, '2020-06-06 05:23:31', '2020-06-06 05:23:31', '2021-06-06 08:23:31'),
('a6a0dc13f76579cf3df548cd694c5fc7df511451cfda8f70df50c70c718c8a881af2f478feace09f', 1, 1, 'authToken', '[]', 0, '2020-05-31 11:08:54', '2020-05-31 11:08:54', '2021-05-31 14:08:54'),
('a8410ac67a1afa0d61d34f1245b51baf65601e9c5393e993119ed9a679d61d1119c03f61f960a1f8', 1, 1, 'authToken', '[]', 0, '2020-05-12 16:15:39', '2020-05-12 16:15:39', '2021-05-12 19:15:39'),
('af3d982c6d29b16a14d6d38d57cd0a66bb6e3c9a3171e2b3491669efe15068b4dd21198fd2fe8604', 1, 1, 'authToken', '[]', 0, '2020-05-10 11:09:40', '2020-05-10 11:09:40', '2021-05-10 14:09:40'),
('b08d42015f08852e8837dca4b09afab3e29be3d3340448467a7ab7f09eb6c35d425d6f5cc4dacc72', 1, 1, 'authToken', '[]', 0, '2020-05-16 13:46:40', '2020-05-16 13:46:40', '2021-05-16 16:46:40'),
('b0ee5b5feccbbe6ce599e50382841d1667abd2745606e2d6f252f8bc1e3c84954cd4f6cd36c660dd', 1, 1, 'authToken', '[]', 0, '2020-05-16 13:11:41', '2020-05-16 13:11:41', '2021-05-16 16:11:41'),
('b29a5a80966e9e33e6b2c9622447683447e656020f4f899710b80d04c83e122bf17e09d98826c175', 1, 1, 'authToken', '[]', 0, '2020-05-31 11:19:13', '2020-05-31 11:19:13', '2021-05-31 14:19:13'),
('b2f1f4980e292f9617dc52c6a37c2a83451942ac6af7702e0ae3d3c2cc60a4d1f75e52f6d66a8676', 1, 1, 'authToken', '[]', 0, '2020-05-12 16:32:11', '2020-05-12 16:32:11', '2021-05-12 19:32:11'),
('b5b09e6c4d03f2fb3401291b54fc28a1a38fb18b1f88d077fe72532a6b1ccb26cf9f17fe49bdd55f', 1, 1, 'authToken', '[]', 0, '2020-05-12 13:58:03', '2020-05-12 13:58:03', '2021-05-12 16:58:03'),
('b885d8e62fbc8b6d3ee0dce3a5f862fb2bf4868da388d32bcaa0db893fa17935d3b99f5d8d508cd3', 1, 1, 'authToken', '[]', 0, '2020-05-12 16:36:19', '2020-05-12 16:36:19', '2021-05-12 19:36:19'),
('ba8cd33319cf17975f57e2c590a8b9f214a5bfd4853b30475b781cac04cae1dc75115a85e9e3f127', 1, 1, 'authToken', '[]', 0, '2020-05-16 14:25:33', '2020-05-16 14:25:33', '2021-05-16 17:25:33'),
('bab04d259a4b5052dde5bd6a1a3ee307d079c1ab8f3100ff4b83b4ceed186c1a2fd8430199705a6b', 1, 1, 'authToken', '[]', 0, '2020-05-12 15:55:24', '2020-05-12 15:55:24', '2021-05-12 18:55:24'),
('bac841c63eb240b5c629606a5aec8edd8a70e554f9de2184eddc19c6a1aff0c8206e2450d6edd1d4', 1, 1, 'authToken', '[]', 0, '2020-05-12 13:57:55', '2020-05-12 13:57:55', '2021-05-12 16:57:55'),
('bb68d893a1ae7195a839e437ad48422aa1ef3911dd247a4f5eefac4a592bfe4a3bf6bc822572d68d', 1, 1, 'authToken', '[]', 0, '2020-05-12 15:20:54', '2020-05-12 15:20:54', '2021-05-12 18:20:54'),
('bbb3d1df13954928f2b284c79683623dd0cb2192e3784364c48fded8bfd6cce0d08e4b385854d6bf', 1, 1, 'authToken', '[]', 0, '2020-05-10 11:11:57', '2020-05-10 11:11:57', '2021-05-10 14:11:57'),
('bc1cbf0ec9a1356125917f45211b5c5c53b0f7898a97b66e269d1daa8e2d5478646ff4694246d95f', 1, 1, 'authToken', '[]', 0, '2020-05-12 13:58:00', '2020-05-12 13:58:00', '2021-05-12 16:58:00'),
('c11a8e05929734f05d960c4b7fe14a86fe7fe7cd685c27b03bebc206ba8a6d8ecda24c819b239f8f', 1, 1, 'authToken', '[]', 0, '2020-05-10 10:03:37', '2020-05-10 10:03:37', '2021-05-10 13:03:37'),
('c2123021cf25a23b5246ec3843486048c4e304f9560cdc2da272b741450d8767cc81a7a8eaabb9a1', 1, 1, 'authToken', '[]', 0, '2020-05-12 13:58:02', '2020-05-12 13:58:02', '2021-05-12 16:58:02'),
('c3eef9c4507480f135764929855f679ca8e57469b736b9f8d8877c155b2b73ffe15762978fdd0045', 6, 1, 'authToken', '[]', 0, '2020-05-16 15:13:02', '2020-05-16 15:13:02', '2021-05-16 18:13:02'),
('c532bbc93f6129355ff780eb61a966e683c9b1acca12802ae0e72814e68c7836dbab037ac17dfdcd', 1, 1, 'authToken', '[]', 0, '2020-05-16 13:15:59', '2020-05-16 13:15:59', '2021-05-16 16:15:59'),
('c62cbc14838cff67d2a94cd25e1ffb9f6d6be16ababeffc19008b8e36c5db969dbe0d895b179f1cd', 1, 1, 'authToken', '[]', 0, '2020-05-12 15:41:27', '2020-05-12 15:41:27', '2021-05-12 18:41:27'),
('c6481ec6ce3d2f631001eef676e9c0245ecaa2d6710d15afb98c74abab4d0a5862f60b3cc37ea79c', 1, 1, 'authToken', '[]', 0, '2020-05-12 15:50:54', '2020-05-12 15:50:54', '2021-05-12 18:50:54'),
('ca8cb2b3ad9e27813e38b0939993a19a0d869b326b9c21272016f7ca4431116a253d34765fef98cc', 1, 1, 'authToken', '[]', 0, '2020-05-12 13:58:05', '2020-05-12 13:58:05', '2021-05-12 16:58:05'),
('cc979e91d9510c12bf1b0bae412e6321a7fb3b45bd020960c7b6eaf1124b1ca725ad949558f77081', 1, 1, 'authToken', '[]', 0, '2020-05-12 16:32:08', '2020-05-12 16:32:08', '2021-05-12 19:32:08'),
('ccc9a3d5e72e35b83945bc46571ec8f5e7da00e3cebcca79845db68705237373e1fe2e040073a35a', 1, 1, 'authToken', '[]', 0, '2020-05-16 06:28:06', '2020-05-16 06:28:06', '2021-05-16 09:28:06'),
('cd23d31951da4f20fb29e58989495e4e77108d9a2939ed6aca8b847cde6e594e6f8cdbb6b3470961', 1, 1, 'authToken', '[]', 0, '2020-05-16 12:56:11', '2020-05-16 12:56:11', '2021-05-16 15:56:11'),
('d2b72658f9d16857cd6cd914360288987efd450e6ecf4055c04d68f1a69c7ca32f99f98f5d9bd237', 1, 1, 'authToken', '[]', 0, '2020-05-10 11:32:45', '2020-05-10 11:32:45', '2021-05-10 14:32:45'),
('d462b0734f1744b1884b4665249caa00b2bd3b100865b953efd03617f3b9982904c75e6bfe012a40', 1, 1, 'authToken', '[]', 0, '2020-05-31 11:34:22', '2020-05-31 11:34:22', '2021-05-31 14:34:22'),
('d947ca478b5997e4272a8d5c766472bec0a7a1fc3a0f2c5b556a01c28706e36c4209d2523c6b3e0d', 1, 1, 'authToken', '[]', 0, '2020-05-16 13:37:41', '2020-05-16 13:37:41', '2021-05-16 16:37:41'),
('d9a403b1b9e3b104b78a870958da9afbb18aac9a224c112697ec9dae3a02f8448af5a4707f25ccff', 1, 1, 'authToken', '[]', 0, '2020-05-16 14:27:57', '2020-05-16 14:27:57', '2021-05-16 17:27:57'),
('dd498fcabf63e63e33d74f8b9317935e0f99d2f39d4d7c35acc72c90ebb84681a4950154e0d3c400', 1, 1, 'authToken', '[]', 0, '2020-05-16 13:09:49', '2020-05-16 13:09:49', '2021-05-16 16:09:49'),
('e12472d581437e80b40127ca549fe304ff9e0ef68149028614e3819cfe7012c139fe0477196c3501', 1, 1, 'authToken', '[]', 0, '2020-05-16 06:23:30', '2020-05-16 06:23:30', '2021-05-16 09:23:30'),
('e2b33ceb11813784d542e7756ed85a1631a4b9f87f0e5cefcd812eb9564a6a0a78e82ee1a980b205', 1, 1, 'authToken', '[]', 0, '2020-05-15 13:59:15', '2020-05-15 13:59:15', '2021-05-15 16:59:15'),
('e306a3173b91e13d68dc960672eff2df30b1ab84d5c4eef99e5dfaf90169c3b1b4ab900525e89818', 1, 1, 'authToken', '[]', 0, '2020-05-16 14:23:04', '2020-05-16 14:23:04', '2021-05-16 17:23:04'),
('e44af0a9f3643a96d5b5a00db7d86b45415a09a0545580eb27d0fb68e571a1f4b46dfbabcc311e57', 1, 1, 'authToken', '[]', 0, '2020-06-06 05:03:56', '2020-06-06 05:03:56', '2021-06-06 08:03:56'),
('e473f3f57e553f8812b0e353c0cca0a2c5f51a0eb3d57fd892e9433aa6a754901e46fb8b5c2ea9ae', 1, 1, 'authToken', '[]', 0, '2020-06-06 05:01:21', '2020-06-06 05:01:21', '2021-06-06 08:01:21'),
('e8005fc397a59b961629d05bec169ed281f375435182c98c87c0e7ad6af058c51131655f045e151a', 1, 1, 'authToken', '[]', 0, '2020-05-08 08:43:49', '2020-05-08 08:43:49', '2021-05-08 11:43:49'),
('e86d780249091e113233ef6c90f7d74c4794920ce00a02bd0c56035ccc5183ba99638ccdd97bc59a', 2, 1, 'authToken', '[]', 0, '2020-05-10 09:00:26', '2020-05-10 09:00:26', '2021-05-10 12:00:26'),
('eca68132455173ca5722364e74a4a4e7e4a8597b89a1299cad561ae2e9c3b79f3f91737fec65c34b', 14, 1, 'authToken', '[]', 0, '2020-05-16 16:37:51', '2020-05-16 16:37:51', '2021-05-16 19:37:51'),
('ef2c3e56462e1b328edaceeb43846e5be0ca399d0c435f4af4e87a8184074cd00e5a7f1eca15050a', 1, 1, 'authToken', '[]', 0, '2020-05-31 11:08:52', '2020-05-31 11:08:52', '2021-05-31 14:08:52'),
('f1bc299a94ae442748a9750028c695b08b4837f4e1822b107d70d50a9cfc4b179cc90daa03d24159', 3, 1, 'authToken', '[]', 0, '2020-05-10 09:55:24', '2020-05-10 09:55:24', '2021-05-10 12:55:24'),
('f3c0bf180fc024e9579dcb65a54881a7230c42f521fac4be3c70484fdbd9138b2830b85010ca3be3', 10, 1, 'authToken', '[]', 0, '2020-05-16 16:32:30', '2020-05-16 16:32:30', '2021-05-16 19:32:30'),
('f8c223fbb17b1b482a6d1d95dd55a306708e800a06e1d44bbb26d0c96ff27a5398a28511d6e8a542', 1, 1, 'authToken', '[]', 0, '2020-05-12 16:15:41', '2020-05-12 16:15:41', '2021-05-12 19:15:41'),
('f986aa9d2954c2d332b1bf922b0540d4bff4b07f8c2b1a0fac3bd5fab5b0135ede4b5151913becfd', 1, 1, 'authToken', '[]', 0, '2020-05-16 13:27:58', '2020-05-16 13:27:58', '2021-05-16 16:27:58'),
('fa93e457c68f67db9d5a71f293a81764ada6d1a6e445f62dd1fbcda7cbcbcb9a9c6fddb64bb4b86d', 1, 1, 'authToken', '[]', 0, '2020-05-16 07:56:23', '2020-05-16 07:56:23', '2021-05-16 10:56:23'),
('fde628d954d2e3415ca4db8ff012ef2a56a3739c1e271348f8fb2389f2f62fe84fafd98863660731', 15, 1, 'authToken', '[]', 0, '2020-06-08 06:34:43', '2020-06-08 06:34:43', '2021-06-08 09:34:43'),
('ff25846f1efc030d32f16921cbe1c28f9990ff7b9d24a7219c7b26aa8a6c577c5ecf660584646e0c', 1, 1, 'authToken', '[]', 0, '2020-05-15 13:58:13', '2020-05-15 13:58:13', '2021-05-15 16:58:13');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_auth_codes`
--

CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `oauth_clients`
--

CREATE TABLE `oauth_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_clients`
--

INSERT INTO `oauth_clients` (`id`, `user_id`, `name`, `secret`, `provider`, `redirect`, `personal_access_client`, `password_client`, `revoked`, `created_at`, `updated_at`) VALUES
(1, NULL, 'TheCommuter Personal Access Client', '46qGEO4nxjcDRZjSoSdVYGyISq5PSy6cG8jJ5QwL', NULL, 'http://localhost', 1, 0, 0, '2020-05-08 08:42:37', '2020-05-08 08:42:37'),
(2, NULL, 'TheCommuter Password Grant Client', 'J7gu0MLFB8iujqqiZHoFc2NXfGp2emVzpEojKDir', 'users', 'http://localhost', 0, 1, 0, '2020-05-08 08:42:37', '2020-05-08 08:42:37');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_personal_access_clients`
--

CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `client_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `oauth_personal_access_clients`
--

INSERT INTO `oauth_personal_access_clients` (`id`, `client_id`, `created_at`, `updated_at`) VALUES
(1, 1, '2020-05-08 08:42:37', '2020-05-08 08:42:37');

-- --------------------------------------------------------

--
-- Table structure for table `oauth_refresh_tokens`
--

CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `password_resets`
--

INSERT INTO `password_resets` (`email`, `token`, `created_at`) VALUES
('b@bl.com', '$2y$10$Kl5S71RBVcj22wyVIOJ1TOEc7PhLJuvVvLSA1JzWt9AtJ/6ExMsL6', '2020-06-08 06:40:29');

-- --------------------------------------------------------

--
-- Table structure for table `tasks`
--

CREATE TABLE `tasks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descritpion` text COLLATE utf8mb4_unicode_ci,
  `due` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `tasks`
--

INSERT INTO `tasks` (`id`, `user_id`, `title`, `descritpion`, `due`, `created_at`, `updated_at`) VALUES
(1, 1, 'Schaefer-D\'Amore', 'Provident voluptatibus molestias culpa neque dolorum sed non. Mollitia voluptates est libero at id vel nihil. Ut maxime perspiciatis eos veniam sunt. Qui autem non sit sapiente ratione tempora. Recusandae architecto architecto quibusdam fugit est ratione ipsam. Dolorem est ex earum distinctio. Fuga accusantium aut voluptatem soluta similique perspiciatis dolorum. Beatae debitis nam nostrum quo. Non rerum voluptas eaque natus optio quis unde recusandae. Dolorum aut dignissimos quibusdam corrupti. Ipsum quidem nihil nobis. Ea culpa excepturi omnis cumque. Error quibusdam est pariatur maxime aut libero. Magnam cum doloremque ipsum iusto. Adipisci eius culpa est atque aspernatur. Qui ut sit eaque eum. Repudiandae consectetur hic nemo asperiores dolores aliquid iusto. Similique sequi velit voluptatem repellendus. Neque a quis ea non. Ipsum qui ea voluptates et sit quis assumenda. Magni similique temporibus ea ea officia aut dolorem. Vel omnis aut magni necessitatibus aspernatur. Omnis quo consectetur reiciendis sit et ducimus inventore.', NULL, '2020-05-08 08:50:34', '2020-05-08 08:50:34'),
(2, 1, 'O\'Hara, O\'Conner and Emmerich', 'Et quae aut accusamus et aut. Quis iste tenetur sit accusantium minus eum quam voluptatem. Iusto molestiae delectus minus non. Minima ut aut est molestias ex in praesentium quos. Repudiandae praesentium fuga minima ut. Nobis dolor et non ut qui. Velit consequatur eveniet in tempora est. Pariatur neque praesentium eos minima vel. Molestias accusamus sunt consectetur aut et. Id recusandae earum sint in voluptas iste dolores aut. Omnis quaerat beatae exercitationem animi velit. Sunt cupiditate modi est id voluptatem libero. Accusantium sequi voluptatem distinctio voluptas quia. Quo velit est exercitationem non sunt. Quia facilis quis molestiae quae. Id magnam similique nostrum officia reprehenderit velit. Ut vel vitae aut eum quos. Quaerat hic unde exercitationem odit. Natus amet sed voluptas odit.', NULL, '2020-05-08 08:50:34', '2020-05-08 08:50:34'),
(3, 1, 'Green and Sons', 'Et et quaerat nihil. Ea dolor rerum aut vel sint. Vero ut ratione dolores est itaque quisquam. Est dolores esse quos quasi fugit. Qui consequuntur consequatur ut illo exercitationem voluptates. Dolor pariatur laudantium dicta accusantium rerum est sunt. Quo magnam ut ut. Esse dolores dolor molestiae consequatur rerum iure. Enim eaque rerum et nostrum pariatur. Animi cumque aliquid corporis aliquam tenetur dolores aperiam. Reiciendis reiciendis doloribus laboriosam dolorem. Et distinctio perspiciatis ea aperiam. Deleniti beatae sint eum aut necessitatibus illo repudiandae. Illo enim rem est commodi rem in. Ipsum aspernatur molestiae quasi facere perspiciatis consequatur sed. Veniam architecto dolore est in. Debitis fugiat est in aliquid temporibus fugit. Mollitia a ea et enim reiciendis qui. Ad placeat natus in odio. Aut eum ut alias voluptate et velit quo. Veritatis dolor esse et magnam officia reprehenderit sapiente. Placeat iste porro voluptates mollitia sit repellat et.', NULL, '2020-05-08 08:50:35', '2020-05-08 08:50:35'),
(4, 1, 'Carter, Moore and Wunsch', 'Ea at est tempora quia tempora. Quo aspernatur mollitia neque animi voluptatem. Incidunt magni in velit voluptatem consequuntur. Quaerat ab nostrum id velit. Ut architecto illo ullam id aspernatur adipisci nam. Qui ea qui est. Aut ipsum quae numquam enim animi. Nulla odit facilis ducimus et laborum qui reprehenderit. Ut voluptas aut voluptatem ipsam debitis. Error illo perspiciatis eos omnis quas autem accusantium. Dolorem molestiae fugiat qui laudantium. Ut est officiis nihil non vero. Eum molestiae voluptates iure nemo. Accusantium omnis sunt ipsam expedita molestiae autem laudantium. Ex et cum vel sit corrupti. Magnam est ducimus quibusdam dolores blanditiis et. Perspiciatis similique aut ipsam eum aut est. Culpa rem nam iure sed. Incidunt enim fuga earum. Animi tempore quas voluptatem facilis hic. Et aut natus dolores beatae est eum corrupti. Iure aut consectetur voluptatibus blanditiis. Delectus aliquid quam est quam repudiandae. Perspiciatis sapiente ex ut qui fuga. Totam molestiae repudiandae dolorem ipsam. Qui voluptas beatae molestias sed illo sint consequatur ea. Quia provident eius voluptate praesentium inventore qui.', NULL, '2020-05-08 08:50:35', '2020-05-08 08:50:35'),
(5, 1, 'Wuckert, Keebler and Lockman', 'Recusandae ut asperiores incidunt. Et at qui veniam libero laudantium architecto. Dolorum voluptatem nam et est. Illum velit explicabo ut aut quia quisquam. Quo qui voluptatum non corporis. Omnis accusantium nam nesciunt quo voluptatem maxime. Dolores quidem sunt mollitia cupiditate. Expedita rerum eos possimus cupiditate deleniti dolorum recusandae. Explicabo perferendis doloremque nisi ea enim dolor. Cumque quaerat voluptates quis ratione cum eaque maiores. Voluptatem sit dignissimos omnis maiores sed. Error sit fuga voluptatibus sint. Vitae delectus recusandae est non harum repellendus hic. Maiores sed consequatur rem incidunt. Doloremque tenetur et iusto aut corporis. Omnis quia et at quidem. Corporis culpa aut consequatur possimus. Dignissimos reiciendis ut quisquam qui perferendis aut. Voluptas tenetur sed occaecati nisi hic totam. Sed quia est recusandae impedit reprehenderit a. Nobis consequatur dignissimos earum voluptas. Odio cum praesentium distinctio quae minus non molestiae. Id rerum nobis quia rem repellendus quia quibusdam. Aut cumque perferendis repellat impedit. Minus totam nihil odio consequatur libero. Aut veritatis quo pariatur ratione voluptatem nam et autem. Omnis ab et quidem voluptas. Blanditiis nihil nostrum est et voluptatem aut.', NULL, '2020-05-08 08:50:35', '2020-05-08 08:50:35'),
(6, 1, 'user created title 2', 'some des', NULL, '2020-05-08 09:22:36', '2020-05-08 09:34:41'),
(7, 1, 'user created title', 'some des', '2020-04-12 00:00:00', '2020-05-08 09:23:28', '2020-05-08 09:23:28'),
(8, 1, 'user created title 2', 'some des', '2020-04-12 00:00:00', '2020-05-08 09:35:25', '2020-05-08 09:56:47');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, 'gichukx', 'g@gmail.com', '2020-05-08 08:46:25', '$2y$10$UjhWCH9hrrvFyaek0/6Ug.BVBXpYv7PMHRjvMj/3/Nu2q9NHaM.nC', NULL, '2020-05-08 08:43:48', '2020-05-08 08:46:25'),
(2, 'blking', 'b@bl.com', NULL, '$2y$10$jLKX.aaTm/9lvHfRAacJquIiWMyaPTZBlcvnwmUijjX26F3xcNKcy', NULL, '2020-05-10 09:00:21', '2020-05-10 09:00:21'),
(3, 'brian', 'brian@Brian.com', NULL, '$2y$10$xB7j9Zieq1RaAwq1hPi.muUs.YVcqqpWhsn86KfVIAfe8ZEN3IFG6', NULL, '2020-05-10 09:55:23', '2020-05-10 09:55:23'),
(4, 'hellen', 'hellen@hellen.com', NULL, '$2y$10$I6MLWlgQWexpCVap7Wtiwef9aYuJYs61p.VUitlehyQajRhQfDH8q', NULL, '2020-05-10 10:15:29', '2020-05-10 10:15:29'),
(5, 'kumu', 'kumu@kumu.com', NULL, '$2y$10$mpZVrx8SNRq0hhUEf0lp0Oby5VERd1jBom9gEkBZzGyMBeDII5t7e', NULL, '2020-05-16 06:14:42', '2020-05-16 06:14:42'),
(6, 'karanja', 'k@kmail.com', NULL, '$2y$10$itdz0HE5S1ZYX1Df03.ik.z/U6bPUB9fMgfNnqI3clK7tpDYW6vX6', NULL, '2020-05-16 15:13:02', '2020-05-16 15:13:02'),
(7, 'kim', 'kim@kim.com', NULL, '$2y$10$72f8ZgCqkm6PyOmz.3840uidfSjdj96Y8UJq2/dVHoPVdU.cw5tSS', NULL, '2020-05-16 15:26:37', '2020-05-16 15:26:37'),
(9, 'kaks', 'k@gmail.com', NULL, '$2y$10$e9tUKu8LMyYgyXqojl.Vve0G0vXYDAyqDI6.X9zF.gqaXozG9ZUFC', NULL, '2020-05-16 15:52:36', '2020-05-16 15:52:36'),
(10, 'kel', 'kel@kel.com', NULL, '$2y$10$v95odSBTDOM7L1a9x4mqCeSeSRmuPC3GqCVBIwSWVknbjSguwfvKC', NULL, '2020-05-16 16:32:24', '2020-05-16 16:32:24'),
(14, 'jack', 'j@j.com', NULL, '$2y$10$UwbhaN9qclmyebXoUVjptengKkizzCbA6B8v0vqICI6SwotkHF5oq', NULL, '2020-05-16 16:37:51', '2020-05-16 16:37:51'),
(15, 'mulaa', 'm@gmail.com', NULL, '$2y$10$q2cPMmfAxz/X3cyUJTIWBO/0t6ygO8JmOeRbLIPL7S5kGAaz1fuFO', NULL, '2020-06-08 06:34:31', '2020-06-08 06:34:31');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_access_tokens`
--
ALTER TABLE `oauth_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_access_tokens_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_auth_codes`
--
ALTER TABLE `oauth_auth_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_auth_codes_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `oauth_clients_user_id_index` (`user_id`);

--
-- Indexes for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `oauth_refresh_tokens`
--
ALTER TABLE `oauth_refresh_tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `tasks`
--
ALTER TABLE `tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tasks_user_id_foreign` (`user_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `oauth_clients`
--
ALTER TABLE `oauth_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `oauth_personal_access_clients`
--
ALTER TABLE `oauth_personal_access_clients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tasks`
--
ALTER TABLE `tasks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tasks`
--
ALTER TABLE `tasks`
  ADD CONSTRAINT `tasks_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
