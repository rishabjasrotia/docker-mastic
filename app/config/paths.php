<?php

$paths = [
    // customizable
    'themes'       => 'themes',
    'assets'       => 'app/assets',
    'media'        => 'media',
    'asset_prefix' => '',
    'plugins'      => 'plugins',
    'translations' => 'translations',
    'local_config' => '%kernel.project_dir%/config/local.php',
];


$root        = $root ?? realpath(__DIR__.'/..');
$projectRoot = $projectRoot ?? \Mautic\CoreBundle\Loader\ParameterLoader::getProjectDirByRoot($root);

if (!empty($_SERVER['HTTP_HOST'])) {
  $host = $_SERVER['HTTP_HOST'];
  $host = explode('.', $host);
  $sub_domain =  $host[0];
  
  if (file_exists($projectRoot.'/config/local-' . $sub_domain. '.php')) {
    $paths['local_config'] = '%kernel.project_dir%/config/local-' . $sub_domain. '.php';
  }
}

// allow easy overrides of the above
if (file_exists($projectRoot.'/config/paths_local.php')) {
    include $projectRoot.'/config/paths_local.php';
} elseif (file_exists($root.'/config/paths_local.php')) {
    include $root.'/config/paths_local.php';
}

// fixed
$paths = array_merge($paths, [
    // remove /app from the root
    'root'    => substr($root, 0, -4),
    'app'     => 'app',
    'bundles' => 'app/bundles',
    'vendor'  => 'vendor',
]);
