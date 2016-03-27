LOKI=loki
SOURCE=source
DEST=html

all:
	$(LOKI) $(SOURCE) $(DEST)

clean:
	rm -rf $(DEST)/*
