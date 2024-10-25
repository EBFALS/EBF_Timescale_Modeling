
# EBF_Timescale_Modeling

This repository contains the code and data used in the analysis described in the paper section **2.6 Timescale Modeling**.

## Overview

Phenology plays a critical role in regulating ecosystem productivity and carbon exchange. In this study, we implemented a **timescale modeling** approach to accurately capture and quantify the influence of phenological changes on resource-use efficiency over different timescales. 

Instead of relying on traditional interpolation techniques, which may introduce inaccuracies due to incomplete data (e.g., greenness index gaps caused by camera malfunctions or adverse weather conditions), we used timescale modeling. This approach allowed for continuity and smoothness in the dataset while optimizing partial correlation coefficients to reveal clearer insights into the role of phenology.

## Methodology

- **Timescale Windows**: The analysis began with a 5-day temporal window, progressively increasing by 1-day increments up to 30 days. This gradual shift helped us observe how the influence of phenology on LUE and WUE evolves over time.
  
- **Moving Averages**: Moving averages were applied to smooth the dataset and mitigate the effects of missing data. This step was critical for maintaining the integrity of the analysis despite incomplete data points.
  
- **Partial Correlation Analysis**: For each timescale, we performed a partial correlation analysis to evaluate the relationships between the greenness index (GCC) and both LUE and WUE, controlling for environmental factors such as temperature and precipitation.

- **Optimization**: An optimization search was conducted across all timescales to identify the optimal period where phenology had the strongest influence on LUE and WUE.

## Custom R Functions

The data processing for this study was conducted using the following custom R functions:
- `meandatafu`: For calculating average data values.
- `meanfun`: Used for smoothing and summarizing the data.
- `moveav`: Applied moving averages to the dataset to ensure continuity.

## How to Use

1. Clone this repository:
   ```bash
   git clone https://github.com/yourusername/EBF_Timescale_Modeling.git
   ```
2. Open and run the provided R scripts to reproduce the analysis. Ensure you have the necessary R packages installed as specified in the `requirements.txt`.

## License

This repository is licensed under the MIT License. See the [LICENSE](LICENSE) file for more details.
