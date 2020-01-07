# % Last Change: Mon Jan 06 11:46:57 PM 2020 CST
# Base Image
FROM continuumio/miniconda3:4.7.12

# Metadata
LABEL software="genomic data analysis" \
	description="docker image for general genomic data analysis" \
	website="https://github.com/litd/dana" \
	documentation="https://github.com/litd/dana" \
	license="https://github.com/litd/dana" \
	tags="Genomics" \
	maintainer="Tiandao Li <litd99@gmail.com>"

# Installation
RUN conda install -c bioconda bcftools && \
	conda install -c bioconda bedtools && \
	conda install -c bioconda htslib && \
	conda install -c bioconda samtools && \
	conda install -c bioconda ucsc-bedsort && \
	conda clean --all --yes

# set timezone
RUN ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime && \
	echo "America/Chicago" > /etc/timezone

CMD [ "/bin/bash" ]

