import { uploadImages } from "../components/upload_image";
import { getValues } from "../components/timer";
import { startTimer } from "../components/timer";

import "../components/flipclock.min";

//------------

uploadImages();
global.uploadImages = uploadImages;
global.getValues = getValues;
global.startTimer = startTimer;
