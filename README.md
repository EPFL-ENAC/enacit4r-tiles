# ENACIT4Research Tiles

ENACIT4Research tile server using [Martin](https://maplibre.org/martin/).

## Operation

1. Setup environment variables

2. Build images and start services

```
make run
```

3. Stop services with:

```
make stop
```

4. Access to Martin's catalog

When running locally:

```
curl http://localhost:3000/catalog | jq
```

Or on the deployed instance:

```
curl https://enacit4r-tiles.epfl.ch/catalog | jq
```

5. Refresh Martin's catalog

Martin does not automatically refresh its catalog, then after new layers have been added to the database, restart the Martin's service:

```
make refresh-catalog
```

## Integration in MapLibre

1. Declare a source

Example of [composite sources](https://maplibre.org/martin/sources-composite.html) (note: use composite sources with caution as it affects processing performance):

```
  "sources": {
    "landuse": {
      "type": "vector",
      "url": "https://enacit4r-tiles.epfl.ch/LandUse_Sg_Sel_2020_abiotic,LandUse_Sg_Sel_2020_biotic"
    }
  }
```

2. Declare layers

Both `source` and `source-layer` must be specified, for instance:

```
  "layers": [
    {
      "id": "landuse_abiotic",
      "source": "landuse",
      "source-layer": "LandUse_Sg_Sel_2020_abiotic",
      ...
    },
    {
      "id": "landuse_biotic",
      "source": "landuse",
      "source-layer": "LandUse_Sg_Sel_2020_biotic",
      ...
    }
  ]
```
