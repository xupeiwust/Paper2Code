MODEL_NAME="deepseek-ai/DeepSeek-Coder-V2-Lite-Instruct"
TP_SIZE=2

PAPER_NAME="Transformer"
PDF_LATEX_CLEANED_PATH="../examples/Transformer_cleaned.tex" # _cleaned.tex
OUTPUT_DIR="../outputs/Transformer_dscoder"
OUTPUT_REPO_DIR="../outputs/Transformer_dscoder_repo"

mkdir -p $OUTPUT_DIR
mkdir -p $OUTPUT_REPO_DIR

echo $PAPER_NAME

echo "------- PaperCoder -------"

python ../codes/1_planning_llm.py \
    --paper_name $PAPER_NAME \
    --model_name ${MODEL_NAME} \
    --tp_size ${TP_SIZE} \
    --pdf_latex_path ${PDF_LATEX_CLEANED_PATH} \
    --paper_format LaTeX \
    --output_dir ${OUTPUT_DIR}

python ../codes/1.1_extract_config.py \
    --paper_name $PAPER_NAME \
    --output_dir ${OUTPUT_DIR}

cp -rp ${OUTPUT_DIR}/planning_config.yaml ${OUTPUT_REPO_DIR}/config.yaml

python ../codes/2_analyzing_llm.py \
    --paper_name $PAPER_NAME \
    --model_name ${MODEL_NAME} \
    --tp_size ${TP_SIZE} \
    --pdf_latex_path ${PDF_LATEX_CLEANED_PATH} \
    --paper_format LaTeX \
    --output_dir ${OUTPUT_DIR}

python ../codes/3_coding_llm.py  \
    --paper_name $PAPER_NAME \
    --model_name ${MODEL_NAME} \
    --tp_size ${TP_SIZE} \
    --pdf_latex_path ${PDF_LATEX_CLEANED_PATH} \
    --paper_format LaTeX \
    --output_dir ${OUTPUT_DIR} \
    --output_repo_dir ${OUTPUT_REPO_DIR} \
