<!DOCTYPE html>
<html lang="fr">
<head>
    <title><?= $this->escapeHtml($title) ?></title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width,user-scalable=no, minimum-scale=1.0, maximum-scale=1.0"/>

    <link rel="shortcut icon" href="<?= BASE_URL_ASSETS ?>images/favicon.ico"/>
    <link href="https://fonts.googleapis.com/css2?family=Ubuntu" rel="stylesheet">

    <!-- page specific css -->
    <link href="<?= BASE_URL_ASSETS ?>css/global.css" rel="stylesheet" type="text/css">
    <link href="<?= BASE_URL_ASSETS ?>css/global.min.css" rel="stylesheet" type="text/css">
    <!--    <link href="--><?php //= BASE_URL_ASSETS?><!--css/pc.css" media="screen and (min-width: 1400px)"-->
    <!--          rel="stylesheet" type="text/css">-->
    <!--    <link href="--><?php //= BASE_URL_ASSETS?><!--css/mobile.css" media="screen and (max-width: 1400px)"-->
    <!--          rel="stylesheet" type="text/css">-->

    <!-- icônes du footer -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.2/css/all.min.css"
          integrity="sha512-1sCRPdkRXhBV2PBLUdRb4tMg1w2YPf37qatUFeS7zlBy7jJI8Lf4VHwWfZZfpXtYSLy85pkm9GaYVYMfw5BC1A=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>

    <!-- page specific js -->
    <script src="<?= BASE_URL_ASSETS ?>js/global.js"></script>

    <?= $head ?? null ?>
</head>
<body class="position-relative">
<?php require("header.php"); ?>
{{content}}
<?php require('footer.php'); ?>
</body>
</html>
