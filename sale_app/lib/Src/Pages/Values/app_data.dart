import 'package:flutter/material.dart';
import 'package:sale_app/Src/Models/item_models.dart';

itemModels cai = itemModels(
  itemName: 'Cải bẹ',
  imgUrl: [
    '/Volumes/DATA/FLUTTER/sale_app/assets/caibe-removebg-preview.png',
    '/Volumes/DATA/FLUTTER/sale_app/assets/hela.jpeg',
    '/Volumes/DATA/FLUTTER/sale_app/assets/namduiga.jpeg',
  ],
  unit: 'gram',
  price: 13500,
  description: 'Cải bẹ xanh baby gói 300g',
);
itemModels he = itemModels(
  itemName: 'Hẹ lá',
  imgUrl: [
    '/Volumes/DATA/FLUTTER/sale_app/assets/hela.jpeg',
    '/Volumes/DATA/FLUTTER/sale_app/assets/hela.jpeg',
    '/Volumes/DATA/FLUTTER/sale_app/assets/hela.jpeg',
  ],
  unit: 'kg',
  price: 13500,
  description: 'Cải bẹ xanh baby gói 300g',
);
itemModels nam = itemModels(
  itemName: 'Nấm đùi gà',
  imgUrl: [
    '/Volumes/DATA/FLUTTER/sale_app/assets/namduiga.jpeg',
    '/Volumes/DATA/FLUTTER/sale_app/assets/namduiga.jpeg',
    '/Volumes/DATA/FLUTTER/sale_app/assets/namduiga.jpeg',
    '/Volumes/DATA/FLUTTER/sale_app/assets/namduiga.jpeg',
  ],
  unit: 'kg',
  price: 13500,
  description: 'Cải bẹ xanh baby gói 300g',
);
itemModels ngo = itemModels(
  itemName: 'Ngò gai',
  imgUrl: [
    '/Volumes/DATA/FLUTTER/sale_app/assets/ngogai.jpeg',
    '/Volumes/DATA/FLUTTER/sale_app/assets/ngogai.jpeg',
    '/Volumes/DATA/FLUTTER/sale_app/assets/ngogai.jpeg',
    '/Volumes/DATA/FLUTTER/sale_app/assets/ngogai.jpeg',
  ],
  unit: 'kg',
  price: 13500,
  description: 'Cải bẹ xanh baby gói 300g',
);
itemModels rau = itemModels(
  itemName: 'Rau thơm',
  imgUrl: [
    '/Volumes/DATA/FLUTTER/sale_app/assets/rauthom.jpeg',
    '/Volumes/DATA/FLUTTER/sale_app/assets/rauthom.jpeg',
    '/Volumes/DATA/FLUTTER/sale_app/assets/rauthom.jpeg',
    '/Volumes/DATA/FLUTTER/sale_app/assets/rauthom.jpeg',
  ],
  unit: 'kg',
  price: 13500,
  description: 'Cải bẹ xanh baby gói 300g',
);
itemModels sa = itemModels(
  itemName: 'Sả cây',
  imgUrl: [
    '/Volumes/DATA/FLUTTER/sale_app/assets/sa.jpeg',
    '/Volumes/DATA/FLUTTER/sale_app/assets/sa.jpeg',
    '/Volumes/DATA/FLUTTER/sale_app/assets/sa.jpeg',
  ],
  unit: 'kg',
  price: 15500000,
  description: 'Cải bẹ xanh baby gói 300g',
);

List<itemModels> items = [
  cai,
  he,
  nam,
  ngo,
  rau,
  sa,
];
List<String> Categories = [
  'cauliflower',
  'eggplant',
  'cabbage',
  'broccoli',
  'perilla leaf',
  'celery',
  'cacarot'
];
