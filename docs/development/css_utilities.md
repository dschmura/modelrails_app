# CSS Utilities
[Home](./README.md) / [Development](development/README.md)

ModelRails utilizes tailwindcss. 

## Loading custom color palletes

Custom color pallets can be loaded into ModelRails to make use of tailored design systems. These namespaced pallettes can be loaded into the tailwind configs, which allows developers to utilize the colors as they would any other tailwindcss defined classes. For example if you had a custom pallette for *company1* that included a color named ```blue-500``` you would be able to utilize the color with regular tailwindcss classess such as ```bg-company1-blue-500``` and ```hover:text-company1-blue-500``` etc. 

To create and load a custom color pallette, create a file in ```app/javascript/tailwindcss_pallettes/``` named for the pallette you want to create ```company1_pallette.js```. 

```
module.exports = {
  company1: {
    red: '#FF5733',
    blue: '#00274c',
  },
};
```

Import the pallette into the ```config/tailwind.config.js``` file

```const company1_colors = require('../app/javascript/tailwindcss_pallettes/company1Colors.js');```

and then use the pallette to 'extend' the theme.  

```
theme: {
    extend: {
      colors: {
        // Use the imported color palettes by namespace
        company1: company1_colors.company1,
        <!-- company2: company2.company2, -->
      },
    },
```