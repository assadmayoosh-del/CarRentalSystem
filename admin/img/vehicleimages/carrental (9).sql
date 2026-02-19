-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: 14 فبراير 2026 الساعة 19:04
-- إصدار الخادم: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `carrental`
--

-- --------------------------------------------------------

--
-- بنية الجدول `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `UserName` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `updationDate` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- إرجاع أو استيراد بيانات الجدول `admin`
--

INSERT INTO `admin` (`id`, `UserName`, `Password`, `updationDate`) VALUES
(1, 'admin', '5c428d8875d2948607f3e3fe134d71b4', '2024-05-01 12:22:38');

-- --------------------------------------------------------

--
-- بنية الجدول `tblbooking`
--

CREATE TABLE `tblbooking` (
  `id` int(11) NOT NULL,
  `BookingNumber` bigint(12) DEFAULT NULL,
  `userEmail` varchar(100) DEFAULT NULL,
  `VehicleId` int(11) DEFAULT NULL,
  `FromDate` varchar(20) DEFAULT NULL,
  `ToDate` varchar(20) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `Status` int(11) DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `LastUpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- إرجاع أو استيراد بيانات الجدول `tblbooking`
--

INSERT INTO `tblbooking` (`id`, `BookingNumber`, `userEmail`, `VehicleId`, `FromDate`, `ToDate`, `message`, `Status`, `PostingDate`, `LastUpdationDate`) VALUES
(2, 241520868, 'hebayousef2962003@gmail.com', 2, '2019-04-25', '0016-05-06', 'hcncdbjcjjcv\r\n', 1, '2025-11-26 17:02:52', '2025-12-14 07:26:21'),
(3, 338169281, 'hebayousef2962003@gmail.com', 1, '2025-12-12', '2025-12-13', 'w', 1, '2025-12-04 08:30:55', '2025-12-14 07:27:27'),
(4, 369087491, 'alaayousef@gmail.cm', 9, '2025-12-06', '2026-01-03', 'DD', 0, '2025-12-29 07:29:22', NULL),
(5, 130375450, 'hebayousef2003@gmail.com', 1, '0052-05-04', '0005-06-05', 'jhbg', 0, '2026-01-17 14:06:02', NULL),
(6, 765341386, 'hebayousef2003@gmail.com', 1, '2026-02-10', '2026-02-11', 'HI', 0, '2026-02-10 07:59:39', NULL),
(7, 192634880, 'reem22@gmail.com', 1, '2026-02-21', '2026-09-11', 'hi im reem', 2, '2026-02-11 19:33:40', '2026-02-12 13:52:19');

-- --------------------------------------------------------

--
-- بنية الجدول `tblbrands`
--

CREATE TABLE `tblbrands` (
  `id` int(11) NOT NULL,
  `BrandName` varchar(120) NOT NULL,
  `CreationDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- إرجاع أو استيراد بيانات الجدول `tblbrands`
--

INSERT INTO `tblbrands` (`id`, `BrandName`, `CreationDate`, `UpdationDate`) VALUES
(1, 'Maruti', '2025-11-01 17:24:34', '2025-11-01 06:26:25'),
(2, 'BMW', '2025-12-02 17:24:34', '2025-12-05 06:26:34'),
(3, 'Audi', '2025-12-02 17:24:34', '2025-12-05 06:26:34'),
(4, 'Nissan', '2025-12-12 17:24:34', '2025-12-12 06:26:34'),
(5, 'Toyota', '2025-12-20 17:24:34', '2025-12-20 06:26:34'),
(7, 'Volkswagon', '2026-01-01 17:24:34', '2026-01-05 06:26:34'),
(8, 'Mercedes-Benz', '2025-12-16 09:39:17', '2025-12-16 09:39:17'),
(9, 'Škoda Auto', '2026-02-07 14:13:09', NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `tblcontactusinfo`
--

CREATE TABLE `tblcontactusinfo` (
  `id` int(11) NOT NULL,
  `Address` tinytext DEFAULT NULL,
  `EmailId` varchar(255) DEFAULT NULL,
  `ContactNo` char(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- إرجاع أو استيراد بيانات الجدول `tblcontactusinfo`
--

INSERT INTO `tblcontactusinfo` (`id`, `Address`, `EmailId`, `ContactNo`) VALUES
(1, 'palestine,Gaza', 'Promodelcarrental@gmail.com', '0593214960');

-- --------------------------------------------------------

--
-- بنية الجدول `tblcontactusquery`
--

CREATE TABLE `tblcontactusquery` (
  `id` int(11) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `EmailId` varchar(120) DEFAULT NULL,
  `ContactNumber` char(11) DEFAULT NULL,
  `Message` longtext DEFAULT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- إرجاع أو استيراد بيانات الجدول `tblcontactusquery`
--

INSERT INTO `tblcontactusquery` (`id`, `name`, `EmailId`, `ContactNumber`, `Message`, `PostingDate`, `status`) VALUES
(2, 'alaa', 'alaayousef@gmail.cm', '0592553907', 'hi Im allaa', '2026-02-11 19:27:20', 1),
(3, 'reem', 'reem22@gmail.com', '0599236689', 'cvbnmghjkl', '2026-02-11 19:36:03', NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `tblpages`
--

CREATE TABLE `tblpages` (
  `id` int(11) NOT NULL,
  `PageName` varchar(255) DEFAULT NULL,
  `type` varchar(255) NOT NULL DEFAULT '',
  `detail` longtext NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- إرجاع أو استيراد بيانات الجدول `tblpages`
--

INSERT INTO `tblpages` (`id`, `PageName`, `type`, `detail`) VALUES
(1, 'Terms and Conditions', 'terms', '																																								<div style=\"font-family: \'Open Sans\', Arial, sans-serif; font-size: 14px; line-height: 1.6;\">\r\n\r\n  <!-- 1. Acceptance of Terms -->\r\n  <div style=\"border: 1px solid #000; border-radius: 8px; padding: 20px; margin-bottom: 15px; background-color: #f9f9f9;\">\r\n    <h4 style=\"font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-weight: bold; color: rgb(153, 0, 0); margin-top: 0px;\">1. Acceptance of Terms</h4><h4 style=\"color: #990000; font-weight: bold; margin-top: 0;\"><span style=\"font-size: 1em; color: rgb(62, 63, 58);\">By accessing or using our website and services, you agree to comply with and be bound by these Terms and Conditions. These terms apply to all visitors, users, and customers who interact with our platform in any way. If you do not agree to any part of these terms, you must discontinue the use of our services immediately.</span></h4>\r\n  </div>\r\n\r\n  <!-- 2. Service Overview -->\r\n  <div style=\"border: 1px solid #000; border-radius: 8px; padding: 20px; margin-bottom: 15px; background-color: #f9f9f9;\">\r\n    <h4 style=\"color: #990000; font-weight: bold; margin-top: 0;\">2. Service Overview</h4>\r\n    <p>Our platform provides users with access to a variety of car-related services, including browsing available vehicles, viewing car details, submitting booking requests, and completing rental or purchase transactions. We reserve the right to modify, suspend, or discontinue any part of the service at any time without prior notice.</p>\r\n  </div>\r\n\r\n  <!-- 3. Eligibility -->\r\n  <div style=\"border: 1px solid #000; border-radius: 8px; padding: 20px; margin-bottom: 15px; background-color: #f9f9f9;\">\r\n    <h4 style=\"color: #990000; font-weight: bold; margin-top: 0;\">3. Eligibility</h4>\r\n    <p>By using our services, you confirm that you are at least 18 years old (or have parental/guardian consent where applicable) and that you have the legal capacity to enter into binding agreements. You also agree that all information you provide is accurate and up-to-date.</p>\r\n  </div>\r\n\r\n  <!-- 4. User Account Responsibilities -->\r\n  <div style=\"border: 1px solid #000; border-radius: 8px; padding: 20px; margin-bottom: 15px; background-color: #f9f9f9;\">\r\n    <h4 style=\"color: #990000; font-weight: bold; margin-top: 0;\">4. User Account Responsibilities</h4>\r\n    <ul>\r\n      <li>Provide complete and accurate information.</li>\r\n      <li>Maintain the confidentiality of your login credentials.</li>\r\n      <li>Notify us immediately if you suspect unauthorized access to your account.</li>\r\n    </ul>\r\n    <p>We are not responsible for any loss or damage resulting from failure to protect your account information.</p>\r\n  </div>\r\n\r\n  <!-- 5. Booking and Rental Policies -->\r\n  <div style=\"border: 1px solid #000; border-radius: 8px; padding: 20px; margin-bottom: 15px; background-color: #f9f9f9;\">\r\n    <h4 style=\"color: #990000; font-weight: bold; margin-top: 0;\">5. Booking and Rental Policies</h4>\r\n    <ul>\r\n      <li>All bookings are subject to availability.</li>\r\n      <li>Prices, fees, and vehicle details may change at any time.</li>\r\n      <li>Additional requirements (such as a valid driving license) may apply when picking up a rented vehicle.</li>\r\n      <li>You are responsible for reviewing the full rental agreement before completing any transaction.</li>\r\n    </ul>\r\n  </div>\r\n\r\n  <!-- 6. Payment Terms -->\r\n  <div style=\"border: 1px solid #000; border-radius: 8px; padding: 20px; margin-bottom: 15px; background-color: #f9f9f9;\">\r\n    <h4 style=\"color: #990000; font-weight: bold; margin-top: 0;\">6. Payment Terms</h4>\r\n    <ul>\r\n      <li>All payments are final unless otherwise stated.</li>\r\n      <li>We reserve the right to refuse or cancel any transaction suspected of fraud or misuse.</li>\r\n      <li>Additional charges may apply in cases of late returns, damages, or violations of the rental agreement.</li>\r\n    </ul>\r\n  </div>\r\n\r\n  <!-- 7. Vehicle Condition and Responsibilities -->\r\n  <div style=\"border: 1px solid #000; border-radius: 8px; padding: 20px; margin-bottom: 15px; background-color: #f9f9f9;\">\r\n    <h4 style=\"color: #990000; font-weight: bold; margin-top: 0;\">7. Vehicle Condition and Responsibilities</h4>\r\n    <ul>\r\n      <li>You are responsible for inspecting the vehicle upon pickup.</li>\r\n      <li>Any damages caused during the rental period may result in additional fees.</li>\r\n      <li>You agree to operate the vehicle safely and in accordance with local laws.</li>\r\n      <li>Returning the vehicle in poor condition may lead to extra cleaning or repair charges.</li>\r\n    </ul>\r\n  </div>\r\n\r\n  <!-- 8. Prohibited Activities -->\r\n  <div style=\"border: 1px solid #000; border-radius: 8px; padding: 20px; margin-bottom: 15px; background-color: #f9f9f9;\">\r\n    <h4 style=\"color: #990000; font-weight: bold; margin-top: 0;\">8. Prohibited Activities</h4>\r\n    <ul>\r\n      <li>Misuse the platform for illegal or unauthorized purposes.</li>\r\n      <li>Attempt to hack, disable, or disrupt the website.</li>\r\n      <li>Submit false information or impersonate any individual.</li>\r\n      <li>Use rented vehicles for racing, towing, or harmful activities.</li>\r\n    </ul>\r\n    <p>Any violation may result in suspension or termination of your account.</p>\r\n  </div>\r\n\r\n  <!-- 9. Intellectual Property Rights -->\r\n  <div style=\"border: 1px solid #000; border-radius: 8px; padding: 20px; margin-bottom: 15px; background-color: #f9f9f9;\">\r\n    <h4 style=\"color: #990000; font-weight: bold; margin-top: 0;\">9. Intellectual Property Rights</h4>\r\n    <p>All content displayed on our website—including logos, images, designs, text, and system structure—is our exclusive property or used under license. You may not copy, reproduce, distribute, or modify any material without prior written consent.</p>\r\n  </div>\r\n\r\n  <!-- 10. Privacy and Data Usage -->\r\n  <div style=\"border: 1px solid #000; border-radius: 8px; padding: 20px; margin-bottom: 15px; background-color: #f9f9f9;\">\r\n    <h4 style=\"color: #990000; font-weight: bold; margin-top: 0;\">10. Privacy and Data Usage</h4>\r\n    <p>Your privacy is important to us. All personal information you submit is handled according to our Privacy Policy. By using our services, you consent to the collection and use of your data for operational and service-related purposes.</p>\r\n  </div>\r\n\r\n  <!-- 11. Third-Party Services -->\r\n  <div style=\"border: 1px solid #000; border-radius: 8px; padding: 20px; margin-bottom: 15px; background-color: #f9f9f9;\">\r\n    <h4 style=\"color: #990000; font-weight: bold; margin-top: 0;\">11. Third-Party Services</h4>\r\n    <ul>\r\n      <li>Their content</li>\r\n      <li>Their policies</li>\r\n      <li>Their actions or decisions</li>\r\n    </ul>\r\n    <p>Using these external sites is done entirely at your own risk.</p>\r\n  </div>\r\n\r\n  <!-- 12. Limitation of Liability -->\r\n  <div style=\"border: 1px solid #000; border-radius: 8px; padding: 20px; margin-bottom: 15px; background-color: #f9f9f9;\">\r\n    <h4 style=\"color: #990000; font-weight: bold; margin-top: 0;\">12. Limitation of Liability</h4>\r\n    <ul>\r\n      <li>Any indirect or incidental damages arising from the use of our platform</li>\r\n      <li>Losses resulting from inaccurate information provided by users</li>\r\n      <li>Technical errors, service interruptions, or unauthorized access by third parties</li>\r\n    </ul>\r\n    <p>You acknowledge that using the platform is at your own responsibility.</p>\r\n  </div>\r\n\r\n  <!-- 13. Modifications to Terms -->\r\n  <div style=\"border: 1px solid #000; border-radius: 8px; padding: 20px; margin-bottom: 15px; background-color: #f9f9f9;\">\r\n    <h4 style=\"color: #990000; font-weight: bold; margin-top: 0;\">13. Modifications to Terms</h4>\r\n    <p>We may update or modify these Terms and Conditions at any time. Continued use of the platform after changes are posted means you agree to the revised terms. It is your responsibility to check this page periodically.</p>\r\n  </div>\r\n\r\n  <!-- 14. Termination -->\r\n  <div style=\"border: 1px solid #000; border-radius: 8px; padding: 20px; margin-bottom: 15px; background-color: #f9f9f9;\">\r\n    <h4 style=\"color: #990000; font-weight: bold; margin-top: 0;\">14. Termination</h4>\r\n    <ul>\r\n      <li>Violate any part of these terms</li>\r\n      <li>Engage in fraudulent or harmful behavior</li>\r\n      <li>Misuse the service in a way that affects other users or our system</li>\r\n    </ul>\r\n    <p>Termination may occur without prior notice.</p>\r\n  </div>\r\n\r\n  <!-- 15. Governing Law -->\r\n  <div style=\"border: 1px solid #000; border-radius: 8px; padding: 20px; margin-bottom: 15px; background-color: #f9f9f9;\">\r\n    <h4 style=\"color: #990000; font-weight: bold; margin-top: 0;\">15. Governing Law</h4>\r\n    <p>These Terms and Conditions are governed by and interpreted according to the applicable laws of your region or country. Any disputes arising under these terms shall be resolved through the competent legal authorities.</p>\r\n  </div>\r\n\r\n  <!-- 16. Contact Information -->\r\n  <div style=\"border: 1px solid #000; border-radius: 8px; padding: 20px; margin-bottom: 15px; background-color: #f9f9f9;\">\r\n    <h4 style=\"color: #990000; font-weight: bold; margin-top: 0;\">16. Contact Information</h4>\r\n    <p>If you have any questions regarding these Terms and Conditions, you can contact us through the support section of our website or via the provided communication channels.</p>\r\n  </div>\r\n\r\n</div>\r\n\r\n										\r\n										\r\n										\r\n										'),
(2, 'Privacy Policy', 'privacy', '<span style=\"color: rgb(0, 0, 0); font-family: &quot;Open Sans&quot;, Arial, sans-serif; font-size: 14px; text-align: justify;\">We are committed to protecting your personal information and ensuring a safe and secure user experience. Any data you provide through our website—such as your name, contact details, booking information, or payment preferences—will be used solely for service-related purposes.\r\n\r\nWe do not share, sell, or disclose your personal data to third parties except when required to process your reservation, comply with legal obligations, or enhance the quality of our services. All information is stored securely and handled according to industry-standard security practices.\r\n\r\nBy using our website, you consent to the collection and use of your information as outlined in this Privacy Policy. We may update this policy from time to time, and any changes will be posted on this page.</span>'),
(3, 'About Us ', 'aboutus', '<span style=\"color: rgb(51, 51, 51); font-family: &quot;Helvetica Neue&quot;, Helvetica, Arial, sans-serif; font-size: 13.3333px;\">At ProModel Car, we strive to make car renting a seamless and reliable experience for everyone. We offer a diverse fleet of modern, well-maintained vehicles to meet the needs of every customer — from compact city cars to spacious SUVs and premium models suited for business travel. All our cars are equipped with essential comfort features including air-conditioning, power steering, and advanced safety systems, ensuring a smooth and secure driving experience.&nbsp;</span><span style=\"color: rgb(52, 52, 52); font-family: Arial, Helvetica, sans-serif;\">Our vehicles are purchased and serviced exclusively through authorized dealerships, guaranteeing quality and performance at every step. We continuously update our fleet with the latest models to provide a fresh, modern, and stylish driving experience. Automatic transmission options are available in all categories, making our services suitable for both locals and visitors.\r\n\r\nWe are an independent service provider, not tied to any single car manufacturer, which allows us to offer a wider selection of brands and models to fit different lifestyles and budgets. Whether you need a car for a business trip, a family vacation, or daily transportation — we have the right choice for you.</span><div><span style=\"color: rgb(62, 62, 62); font-family: &quot;Lucida Sans Unicode&quot;, &quot;Lucida Grande&quot;, sans-serif; font-size: 11px;\">Our mission is to become a trusted leader in the car rental industry by adopting innovative solutions, building strong partnerships, and delivering fast, efficient, and friendly service. We believe that renting a car should be simple, transparent, and tailored to the customer — and that’s exactly what we aim to achieve every day.\r\n\r\nYou choose the destination, we provide the drive.</span><span style=\"color: rgb(52, 52, 52); font-family: Arial, Helvetica, sans-serif;\"><br></span></div>'),
(11, 'FAQs', 'faqs', '																																																												<style>\r\n  .faq-container {\r\n    display: flex;\r\n    flex-wrap: wrap;\r\n    justify-content: center;\r\n    gap: 20px;\r\n    font-family: \'Open Sans\', Arial, sans-serif;\r\n    padding: 15px;\r\n  }\r\n\r\n  .faq-box {\r\n    border: 2px solid #000000;\r\n    border-radius: 50%; \r\n    padding: 25px;\r\n    width: 250px;\r\n    height: 250px;\r\n    display: flex;\r\n    flex-direction: column;\r\n    justify-content: center;\r\n    align-items: center;\r\n    background-color: #f7fafe;\r\n    text-align: center;\r\n    box-shadow: 0 4px 8px rgba(0,0,0,0.1);\r\n    transition: transform 0.3s;\r\n  }\r\n\r\n  .faq-box:hover {\r\n    transform: scale(1.05);\r\n  }\r\n\r\n  .faq-question {\r\n    color: #ef161f;\r\n    font-weight: bold;\r\n    margin-bottom: 10px;\r\n    font-size: 18px;\r\n  }\r\n\r\n  .faq-answer {\r\n    color: #000000;\r\n    font-size: 14px;\r\n  }\r\n\r\n  .faq-answer ul {\r\n    padding-left: 15px;\r\n    text-align: left;\r\n  }\r\n</style>\r\n\r\n<div class=\"faq-container\">\r\n\r\n  <div class=\"faq-box\">\r\n    <div class=\"faq-question\"><span style=\"font-size: medium;\">1. How can I book a car through the website?</span></div>\r\n    <div class=\"faq-answer\">You can select the car you want, click on “Book Now”, fill in the required details, and your reservation will be confirmed via email or phone.</div>\r\n  </div>\r\n\r\n  <div class=\"faq-box\">\r\n    <div class=\"faq-question\"><span style=\"font-size: medium;\">2. Are the displayed prices inclusive of insurance?</span></div>\r\n    <div class=\"faq-answer\">This depends on the car type and rental plan. Full insurance details are provided during the booking process.</div>\r\n  </div>\r\n\r\n  <div class=\"faq-box\">\r\n    <div class=\"faq-question\"><span style=\"font-size: medium;\">3. Can I modify or cancel my reservation?</span></div>\r\n    <div class=\"faq-answer\">Yes, you can modify or cancel your booking within the allowed time frame. Additional fees may apply depending on the cancellation policy.</div>\r\n  </div>\r\n\r\n  <div class=\"faq-box\">\r\n    <div class=\"faq-question\"><span style=\"font-size: medium;\"><br></span></div><div class=\"faq-question\"><span style=\"font-size: medium;\">4. What documents are required to pick up the car?</span></div>\r\n    <div class=\"faq-answer\">\r\n      You will need:\r\n      <br><span style=\"text-align: left;\">A valid ID or passport</span><br><span style=\"text-align: left;\">A valid driver’s license</span><br><span style=\"text-align: left;\">A copy of your booking confirmation</span><ul>\r\n      </ul>\r\n    </div>\r\n  </div>\r\n\r\n  <div class=\"faq-box\">\r\n    <div class=\"faq-question\"><span style=\"font-size: medium;\"><br></span></div><div class=\"faq-question\"><span style=\"font-size: medium;\">5. Are there any additional fees?</span></div>\r\n    <div class=\"faq-answer\"><span style=\"font-size: medium;\">\r\n      Extra charges may apply for:\r\n      </span><ul>\r\n        Late return\r\n        Fuel not refilled\r\n        Damages not covered insurance\r\n      </ul>\r\n    </div>\r\n  </div>\r\n\r\n  <div class=\"faq-box\">\r\n    <div class=\"faq-question\"><span style=\"font-size: medium;\">6. What should I do if I face an issue with the car?</span></div>\r\n    <div class=\"faq-answer\">Please contact our customer support immediately. We will assist you or provide a replacement vehicle if needed.</div>\r\n  </div>\r\n\r\n  <div class=\"faq-box\">\r\n    <div class=\"faq-question\"><span style=\"font-size: medium;\">7. Can I test drive the vehicle before renting?</span></div>\r\n    <div class=\"faq-answer\">In some cases, yes. Test drives depend on availability and the type of vehicle.</div>\r\n  </div>\r\n\r\n  <div class=\"faq-box\">\r\n    <div class=\"faq-question\"><span style=\"font-size: medium;\">8. Can I rent a car for someone else?</span></div>\r\n    <div class=\"faq-answer\">Yes, as long as the recipient’s personal information and valid driver’s license are provided.</div>\r\n  </div>\r\n\r\n  <div class=\"faq-box\">\r\n    <div class=\"faq-question\"><span style=\"font-size: medium;\">9. Can I pick up the car from a different location?</span></div>\r\n    <div class=\"faq-answer\">This is possible depending on the available service areas. Additional fees may apply.</div>\r\n  </div>\r\n\r\n</div>\r\n\r\n										\r\n										\r\n										\r\n										\r\n										\r\n										');

-- --------------------------------------------------------

--
-- بنية الجدول `tblsubscribers`
--

CREATE TABLE `tblsubscribers` (
  `id` int(11) NOT NULL,
  `SubscriberEmail` varchar(120) DEFAULT NULL,
  `PostingDate` timestamp NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- إرجاع أو استيراد بيانات الجدول `tblsubscribers`
--

INSERT INTO `tblsubscribers` (`id`, `SubscriberEmail`, `PostingDate`) VALUES
(6, 'alaayousef@gmail.cm', '2025-12-18 08:14:43'),
(7, 'reem22@gmail.com', '2026-02-11 19:36:36');

-- --------------------------------------------------------

--
-- بنية الجدول `tbltestimonial`
--

CREATE TABLE `tbltestimonial` (
  `id` int(11) NOT NULL,
  `UserEmail` varchar(100) NOT NULL,
  `Testimonial` mediumtext NOT NULL,
  `PostingDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` int(11) DEFAULT NULL,
  `Rating` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- إرجاع أو استيراد بيانات الجدول `tbltestimonial`
--

INSERT INTO `tbltestimonial` (`id`, `UserEmail`, `Testimonial`, `PostingDate`, `status`, `Rating`) VALUES
(1, 'hebayousef2962003@gmail.com', 'FGH;FJ,[TRLU[P5]6;E6UHD', '2025-12-14 07:29:41', 0, 0),
(2, 'hebayousef2962003@gmail.com', 'I would like to express my sincere thanks and appreciation to this rental platform for the excellent service and professional treatment. My experience as a customer was outstanding in terms of easy booking, vehicle quality, and quick response. I am very happy dealing with you and highly recommend this platform for its reliability and trustworthiness. Thank you, and I wish you continued success.', '2025-12-16 09:50:50', 0, 0),
(3, 'alaayousef@gmail.cm', '??? ????? ??? ?????? ???? \r\n?? ???????? ???????? ??????? ?????????? \r\nTop Top', '2025-12-18 07:44:41', 0, 0),
(4, 'hebayousef2962003@gmail.com', '\r\nI am very grateful for your cooperation. I have the utmost respect for your honesty and kindness, and thank you', '2025-12-18 08:07:52', 1, 0),
(5, 'hebayousef2003@gmail.com', '\r\nI am very grateful for your cooperation. I have the utmost respect for your honesty and kindness, and thank you', '2025-12-18 09:08:26', 1, 0),
(6, 'alaayousef@gmail.cm', '\r\nI am very grateful for your cooperation. I have the utmost respect for your honesty and kindness, and thank you', '2025-12-18 09:09:17', 1, 0),
(7, 'safaa@gmail.com', 'Thank you for your kind efforts\r\nNumber One :).', '2025-12-18 09:11:36', 0, 0),
(8, 'safaa@gmail.com', 'Thank you for your kind efforts\r\nI am very happy to be dealing with you.\r\nAll respect and appreciation\r\nNumber One :).', '2025-12-18 09:13:48', 1, 0),
(9, 'hebayousef2003@gmail.com', 'awrwe', '2026-02-01 08:20:38', NULL, 0),
(10, 'reem22@gmail.com', 'the system is very good and esay', '2026-02-11 19:34:42', NULL, 0);

-- --------------------------------------------------------

--
-- بنية الجدول `tblusers`
--

CREATE TABLE `tblusers` (
  `id` int(11) NOT NULL,
  `FullName` varchar(120) DEFAULT NULL,
  `EmailId` varchar(100) DEFAULT NULL,
  `Password` varchar(100) DEFAULT NULL,
  `ContactNo` char(11) DEFAULT NULL,
  `dob` varchar(100) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL,
  `City` varchar(100) DEFAULT NULL,
  `Country` varchar(100) DEFAULT NULL,
  `RegDate` timestamp NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- إرجاع أو استيراد بيانات الجدول `tblusers`
--

INSERT INTO `tblusers` (`id`, `FullName`, `EmailId`, `Password`, `ContactNo`, `dob`, `Address`, `City`, `Country`, `RegDate`, `UpdationDate`) VALUES
(1, 'Test', 'test@gmail.com', 'f925916e2754e5e03f75dd58a5733251', '6465465465', '', 'L-890, Gaur City Ghaziabad', 'Ghaziabad', 'India', '2024-05-01 14:00:49', '2024-06-05 05:27:37'),
(2, 'Amit', 'amikt12@gmail.com', 'f925916e2754e5e03f75dd58a5733251', '1425365214', NULL, NULL, NULL, NULL, '2024-06-05 05:31:05', NULL),
(3, 'may', 'hebayousef2962003@gmail.com', '202cb962ac59075b964b07152d234b70', '0597424686', '', 'ALsalam', 'DeerAlbalh', 'palestine', '2025-11-26 16:55:25', '2025-12-18 08:16:12'),
(4, 'may', 'hebyousef2962003@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '0597424686', NULL, NULL, NULL, NULL, '2025-11-26 17:38:49', NULL),
(5, 'may', 'hebyousef2962003@gmail.com', '81dc9bdb52d04dc20036dbd8313ed055', '0597424686', NULL, NULL, NULL, NULL, '2025-11-26 17:39:26', NULL),
(6, 'Heba', 'hebayousef2003@gmail.com', '827ccb0eea8a706c4c34a16891f84e7b', '0596321589', '29/6/2003', 'AlNabolsy', 'Gaza', 'Gaza', '2025-12-17 06:57:53', '2026-02-01 06:43:44'),
(7, 'alaa', 'alaayousef@gmail.cm', '202cb962ac59075b964b07152d234b70', '0592553907', '10/3/2002', 'Alawada', 'Rafah', 'palestine', '2025-12-18 07:39:26', '2025-12-18 07:41:55'),
(8, 'Safaa ', 'safaa@gmail.com', '202cb962ac59075b964b07152d234b70', '0592553907', NULL, NULL, NULL, NULL, '2025-12-18 09:11:18', NULL),
(9, 'reem', 'reem22@gmail.com', 'e10adc3949ba59abbe56e057f20f883e', '0599236638', NULL, NULL, NULL, NULL, '2026-02-11 19:31:54', NULL);

-- --------------------------------------------------------

--
-- بنية الجدول `tblvehicles`
--

CREATE TABLE `tblvehicles` (
  `id` int(11) NOT NULL,
  `VehiclesTitle` varchar(150) DEFAULT NULL,
  `VehiclesBrand` int(11) DEFAULT NULL,
  `VehiclesOverview` longtext DEFAULT NULL,
  `PricePerDay` int(11) DEFAULT NULL,
  `FuelType` varchar(100) DEFAULT NULL,
  `ModelYear` int(6) DEFAULT NULL,
  `SeatingCapacity` int(11) DEFAULT NULL,
  `Vimage1` varchar(120) DEFAULT NULL,
  `Vimage2` varchar(120) DEFAULT NULL,
  `Vimage3` varchar(120) DEFAULT NULL,
  `Vimage4` varchar(120) DEFAULT NULL,
  `Vimage5` varchar(120) DEFAULT NULL,
  `AirConditioner` int(11) DEFAULT NULL,
  `PowerDoorLocks` int(11) DEFAULT NULL,
  `AntiLockBrakingSystem` int(11) DEFAULT NULL,
  `BrakeAssist` int(11) DEFAULT NULL,
  `PowerSteering` int(11) DEFAULT NULL,
  `DriverAirbag` int(11) DEFAULT NULL,
  `PassengerAirbag` int(11) DEFAULT NULL,
  `PowerWindows` int(11) DEFAULT NULL,
  `CDPlayer` int(11) DEFAULT NULL,
  `CentralLocking` int(11) DEFAULT NULL,
  `CrashSensor` int(11) DEFAULT NULL,
  `LeatherSeats` int(11) DEFAULT NULL,
  `RegDate` timestamp NOT NULL DEFAULT current_timestamp(),
  `UpdationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- إرجاع أو استيراد بيانات الجدول `tblvehicles`
--

INSERT INTO `tblvehicles` (`id`, `VehiclesTitle`, `VehiclesBrand`, `VehiclesOverview`, `PricePerDay`, `FuelType`, `ModelYear`, `SeatingCapacity`, `Vimage1`, `Vimage2`, `Vimage3`, `Vimage4`, `Vimage5`, `AirConditioner`, `PowerDoorLocks`, `AntiLockBrakingSystem`, `BrakeAssist`, `PowerSteering`, `DriverAirbag`, `PassengerAirbag`, `PowerWindows`, `CDPlayer`, `CentralLocking`, `CrashSensor`, `LeatherSeats`, `RegDate`, `UpdationDate`) VALUES
(1, 'Maruti Suzuki Wagon R', 1, 'Maruti Wagon R Latest Updates\r\n\r\nMaruti Suzuki has launched the BS6 Wagon R S-CNG in India. The LXI CNG and LXI (O) CNG variants now cost Rs 5.25 lakh and Rs 5.32 lakh respectively, up by Rs 19,000. Maruti claims a fuel economy of 32.52km per kg. The CNG Wagon R’s continuation in the BS6 era is part of the carmaker’s ‘Mission Green Million’ initiative announced at Auto Expo 2020.\r\n\r\nPreviously, the carmaker had updated the 1.0-litre powertrain to meet BS6 emission norms. It develops 68PS of power and 90Nm of torque, same as the BS4 unit. However, the updated motor now returns 21.79 kmpl, which is a little less than the BS4 unit’s 22.5kmpl claimed figure. Barring the CNG variants, the prices of the Wagon R 1.0-litre have been hiked by Rs 8,000.', 500, 'Petrol', 2019, 5, 'rear-3-4-left-589823254_930x620.jpg', 'tail-lamp-1666712219_930x620.jpg', 'rear-3-4-right-520328200_930x620.jpg', 'steering-close-up-1288209207_930x620.jpg', 'boot-with-standard-luggage-202327489_930x620.jpg', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2024-05-10 07:04:35', '2024-06-05 05:30:19'),
(2, 'BMW 5 Series', 2, 'BMW 5 Series price starts at ? 55.4 Lakh and goes upto ? 68.39 Lakh. The price of Petrol version for 5 Series ranges between ? 55.4 Lakh - ? 60.89 Lakh and the price of Diesel version for 5 Series ranges between ? 60.89 Lakh - ? 68.39 Lakh.', 1000, 'Petrol', 2018, 5, 'BMW-5-Series-Exterior-102005.jpg', 'BMW-5-Series-New-Exterior-89729.jpg', 'BMW-5-Series-Exterior-102006.jpg', 'BMW-5-Series-Interior-102021.jpg', 'BMW-5-Series-Interior-102022.jpg', 1, 1, 1, 1, 1, 1, 1, 1, NULL, 1, 1, 1, '2024-05-10 07:04:35', '2024-06-05 05:30:33'),
(3, 'Audi Q8', 3, 'As per ARAI, the mileage of Q8 is 0 kmpl. Real mileage of the vehicle varies depending upon the driving habits. City and highway mileage figures also vary depending upon the road conditions.', 3000, 'Petrol', 2017, 5, 'audi-q8-front-view4.jpg', '1920x1080_MTC_XL_framed_Audi-Odessa-Armaturen_Spiegelung_CC_v05.jpg', 'audi1.jpg', '1audiq8.jpg', 'audi-q8-front-view4.jpeg', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2024-05-10 07:04:35', '2024-06-05 05:30:33'),
(4, 'Nissan Kicks', 4, 'Latest Update: Nissan has launched the Kicks 2020 with a new turbocharged petrol engine. You can read more about it here.\r\n\r\nNissan Kicks Price and Variants: The Kicks is available in four variants: XL, XV, XV Premium, and XV Premium(O).', 800, 'Petrol', 2020, 5, 'front-left-side-47.jpg', 'kicksmodelimage.jpg', 'download.jpg', 'kicksmodelimage.jpg', '', 1, NULL, NULL, 1, NULL, NULL, 1, 1, NULL, NULL, NULL, 1, '2024-05-10 07:04:35', '2024-06-05 05:30:33'),
(5, 'Nissan GT-R', 4, ' The GT-R packs a 3.8-litre V6 twin-turbocharged petrol, which puts out 570PS of max power at 6800rpm and 637Nm of peak torque. The engine is mated to a 6-speed dual-clutch transmission in an all-wheel-drive setup. The 2+2 seater GT-R sprints from 0-100kmph in less than 3', 2000, 'Petrol', 2019, 5, 'Nissan-GTR-Right-Front-Three-Quarter-84895.jpg', 'Best-Nissan-Cars-in-India-New-and-Used-1.jpg', '2bb3bc938e734f462e45ed83be05165d.jpg', '2020-nissan-gtr-rakuda-tan-semi-aniline-leather-interior.jpg', 'images.jpg', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2024-05-10 07:04:35', '2024-06-05 05:30:33'),
(6, 'Nissan Sunny 2020', 4, 'Value for money product and it was so good It is more spacious than other sedans It looks like a luxurious car.', 400, 'CNG', 2018, 5, 'Nissan-Sunny-Right-Front-Three-Quarter-48975_ol.jpg', 'images (1).jpg', 'Nissan-Sunny-Interior-114977.jpg', 'nissan-sunny-8a29f53-500x375.jpg', 'new-nissan-sunny-photo.jpg', 1, 1, NULL, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2024-05-10 07:04:35', '2024-06-05 05:30:33'),
(7, 'Toyota Fortuner', 5, 'Toyota Fortuner Features: It is a premium seven-seater SUV loaded with features such as LED projector headlamps with LED DRLs, LED fog lamp, and power-adjustable and foldable ORVMs. Inside, the Fortuner offers features such as power-adjustable driver seat, automatic climate control, push-button stop/start, and cruise control.\r\n\r\nToyota Fortuner Safety Features: The Toyota Fortuner gets seven airbags, hill assist control, vehicle stability control with brake assist, and ABS with EBD.', 3000, 'Petrol', 2020, 5, '2015_Toyota_Fortuner_(New_Zealand).jpg', 'toyota-fortuner-legender-rear-quarters-6e57.jpg', 'zw-toyota-fortuner-2020-2.jpg', 'download (1).jpg', '', NULL, NULL, NULL, NULL, NULL, 1, NULL, 1, NULL, 1, 1, 1, '2024-05-10 07:04:35', '2024-06-05 05:30:33'),
(8, 'Maruti Suzuki Vitara Brezza', 1, 'The new Vitara Brezza is a well-rounded package that is feature-loaded and offers good drivability. And it is backed by Maruti’s vast service network, which ensures a peace of mind to customers. The petrol motor could have been more refined and offered more pep.', 600, 'Petrol', 2018, 5, 'marutisuzuki-vitara-brezza-right-front-three-quarter3.jpg', 'marutisuzuki-vitara-brezza-rear-view37.jpg', 'marutisuzuki-vitara-brezza-dashboard10.jpg', 'marutisuzuki-vitara-brezza-boot-space59.jpg', 'marutisuzuki-vitara-brezza-boot-space28.jpg', NULL, 1, 1, 1, NULL, NULL, 1, NULL, NULL, NULL, 1, NULL, '2024-05-10 07:04:35', '2024-06-05 05:30:33'),
(12, 'Fabia', 9, 'The Skoda Fabia is a well-balanced and practical hatchback that offers good fuel efficiency, easy drivability, and a comfortable ride for city use. It comes with essential safety and convenience features, making it a reliable choice for daily commuting. However, the engine performance is modest, and interior space is smaller compared to larger models in Škoda’s lineup.', 500, 'Petrol', 2020, 5, 'Fabia4.jpg', 'Fabia2.jpg', 'Fabia3.jpg', 'Fabia1.jpg', 'Fabia5.jpg', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2026-02-07 14:19:09', '2026-02-09 11:45:53'),
(13, 'Toyota Corolla 2022', 5, 'A reliable and fuel-efficient sedan, perfect for daily city driving and long trips.\r\nThe Toyota Corolla 2022 offers a comfortable interior, smooth performance, advanced safety features, and modern design, making it an excellent choice for families and individuals.', 200, 'Petrol', 2022, 5, 'tyouta1.jpg', 'tyoyta2.jpg', 'tyoyta3.jpg', 'tyoyta4.jpg', 'tyoyta5.jpg', 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, '2026-02-09 11:55:17', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblbooking`
--
ALTER TABLE `tblbooking`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblbrands`
--
ALTER TABLE `tblbrands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcontactusinfo`
--
ALTER TABLE `tblcontactusinfo`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcontactusquery`
--
ALTER TABLE `tblcontactusquery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblpages`
--
ALTER TABLE `tblpages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblsubscribers`
--
ALTER TABLE `tblsubscribers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbltestimonial`
--
ALTER TABLE `tbltestimonial`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblusers`
--
ALTER TABLE `tblusers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `EmailId` (`EmailId`);

--
-- Indexes for table `tblvehicles`
--
ALTER TABLE `tblvehicles`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblbooking`
--
ALTER TABLE `tblbooking`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tblbrands`
--
ALTER TABLE `tblbrands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tblcontactusinfo`
--
ALTER TABLE `tblcontactusinfo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tblcontactusquery`
--
ALTER TABLE `tblcontactusquery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tblpages`
--
ALTER TABLE `tblpages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT for table `tblsubscribers`
--
ALTER TABLE `tblsubscribers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbltestimonial`
--
ALTER TABLE `tbltestimonial`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `tblusers`
--
ALTER TABLE `tblusers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `tblvehicles`
--
ALTER TABLE `tblvehicles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
