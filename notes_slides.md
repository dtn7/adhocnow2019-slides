# Slide Notes

## Title

- Name is Alvar Penning
- Here on behalf of the Distributed Systems Group, UMR
- Present *DTN7: An Open-Source Disruption-tolerant Networking Implementation
  of Bundle Protocol 7*


## DTN

- Even nowadays lots of situations without a reliable uplink
    - Environmental monitoring, destroyed or censored infrastructure
- Example: sensor on the top, sink bottom's right hand side; no celluar network
- DTN now! Delay / Disruption-tolerant Networking
    - Store-carry-forward instead of a continous connection stream
    - Message goes hop-by-hop - whenever possible
    - Not time critical


## DTN7

- Such a DTN software is DTN7
- FOSS
- Golang: memory safe, compiles to many targets
- Modularized design, esay to extend; exchangable components
- Implements BP7


## BP7

- DTN architecture and network protocol
- Active development, draft 14 released 2 months ago
    - However, it was version 13 before
- Aims to obsolete older BP6


## Nodes and Endpoints

- Nodes are identified by an EID, URI
- Nodes might be addressed by multiple EIDs
- EID might address multiple Nodes; Multicast
- Explain example


## Bundles and Blocks

- Packets called Bundles: sequence of blocks
- Concise Binary Object Representation (CBOR)
- Example: multiple Blocks in Bundle
- Example: Primary Block
    - Destination, Source as IP
    - Ctrl Flags and Report-To for delivery / forwarding
- Example: Canonical Blocks
    - Other blocks are of the same structure
    - Identified by type code
    - Hop Count / Previous Node / ...
- Example: Payload Block
    - Last block
    - Contains Bundle's payload / the message


## Bundle Exchange

- Exchange between two nodes has 2 sides: Transport and Routing
- Transport is CL
    - Currently TCP (MTCP, TCPCL)
    - Everything is possible
- Routing
    - DTLSR, Spray and Wait, Epidemic
    - More is comming


## Other DTN components

- Store on each node; for store-carry-forward
- RESTful API to create and fetch Bundles
    - Easy from any programming language / curl / wget
- Peer Discovery on UDP multicast
    - Creates CL link between neighboring nodes


## DTN7 Programs

- Daemon `dtnd` for DTN
- Command line companion tool `dtncat` for RESTful API


## DTN7 Architecture

- Short explaination


## Evaluation

- Used CORE, Linux namespace containers
- Up to 64 nodes in chain - pairwise connected as in illustration
- To not measure CPU, limited link to 54 MBit/s - simulation of IEEE 802.11g

- Range of payload sizes from 64 KiB - 100 MiB; assigned representing labels
- Created competition to other DTN/DTN-like software
    - DTN7
    - Forban: HTTP exchange
    - IBR-DTN: BP6
    - Serval: custom DTN protocol


## Results

- 2 and 64 nodes
- IBR-DTN and DTN7 are fastest
- Best for small files; big files saturizes bandwith limitation


## CPU/Network

- Full satuation
- Low CPU load
