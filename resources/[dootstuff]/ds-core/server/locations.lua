QBCore = exports['qb-core']:GetCoreObject()

local paydirtArea = {
    name = 'Paydirt',
    renderDistance = 200.0,
    coords = {
      x = 2952.25, y = 2789.91, z = 41.42
    },
    radius = 20.0,
    amount = 15,
    regrowTime = 3,
    blip = {
      blipVisible = true,
      areaVisible = true,
      icon = 547,
      color = 61,
      scale = 0.9,
    },
    items = {
      {
        item = 'paydirt',
        chance = 80,
        amount = {
          min = 1,
          max = 3,
        },
      },
      {
        item = 'dense_paydirt',
        chance = 20,
        amount = {
          min = 1,
          max = 2,
        },
      },
    },
    props = {
      {
        hash = 'prop_rock_3_b',
        textureVariation = 4,
        minimumDistanceBetween = 3,
        offset = {
          x = 0.0, y = 0.0, z = -0.3,
        },
        animation = {
          duration = 5,
          dict = 'random@burial',
          anim = 'a_burial',
          flag = 1,
        },
        tool = {
          model = 'prop_tool_shovel',
          pos = {
            x = 0.0, y = 0.0, z = 0.24,
          },
          rot = {
            x = 0.0, y = 0.0, z = 0.0,
          },
          bone = 28422
        },
        labelSingular = 'Paydirt',
        labelPlurar = 'Paydirt',
        collectMessage = 'Mine Paydirt',
        icon = 'fas fa-seedling',
        glow = {
          rgb = {190, 255, 190},
          scale = 1.75,
          intensity = 3,
        }
      }, 
    },
  }

  local highQualityPaydirtArea = {
    name = 'High Quality Paydirt',
    renderDistance = 200.0,
    coords = {
      x = 501.46, y = 5588.54, z = 794.6
    },
    radius = 20.0,
    amount = 15,
    regrowTime = 5,
    blip = {
      blipVisible = false,
      areaVisible = false,
      icon = 547,
      color = 61,
      scale = 0.9,
    },
    items = {
      {
        item = 'paydirt',
        chance = 20,
        amount = {
          min = 1,
          max = 3,
        },
      },
      {
        item = 'dense_paydirt',
        chance = 60,
        amount = {
          min = 1,
          max = 3,
        },
      },
      {
        item = 'premium_paydirt',
        chance = 20,
        amount = {
          min = 1,
          max = 2,
        },
      },
    },
    props = {
      {
        hash = 'prop_rock_3_c',
        textureVariation = 4,
        minimumDistanceBetween = 3,
        offset = {
          x = 0.0, y = 0.0, z = -0.3,
        },
        animation = {
          duration = 5,
          dict = 'random@burial',
          anim = 'a_burial',
          flag = 1,
        },
        tool = {
          model = 'prop_tool_shovel',
          pos = {
            x = 0.0, y = 0.0, z = 0.24,
          },
          rot = {
            x = 0.0, y = 0.0, z = 0.0,
          },
          bone = 28422
        },
        labelSingular = 'Paydirt',
        labelPlurar = 'Paydirt',
        collectMessage = 'Mine Paydirt',
        icon = 'fas fa-seedling',
        glow = {
          rgb = {190, 255, 190},
          scale = 10,
          intensity = 10,
        }
      }, 
    },
  }


  exports['kq_lootareas']:CreateArea('paydirt_area', paydirtArea)
  exports['kq_lootareas']:CreateArea('hqpaydirt_area', highQualityPaydirtArea)
