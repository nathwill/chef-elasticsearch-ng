# elasticsearch-ng

A simplified elasticsearch cookbook designed to produce
the minimum viable configuration, while still providing
enough flexibility to drive a more complex configuration.

Most of the simplicity is achieved by taking advantage of
the Elastic-provided package repositories, as opposed to
performing an installation from source.

# Recipes

## elasticsearch-ng::default

includes the other recipes required to install, configure,
and manage a standalone elasticsearch installation.

## elasticsearch-ng::repo

configures the elasticsearch repository

## elasticsearch-ng::install

includes the java::default recipe and installs elasticsearch
via a package

## elasticsearch-ng::configure

configures elasticsearch configuration and environment
files, driven by the config and env attribute hashes.

## elasticsearch-ng::service

provides elasticsearch service resource

## elasticsearch-ng::cluster

performs the same operations as the default recipe, after
adding setting simple cluster configuration attributes
based on search results.
