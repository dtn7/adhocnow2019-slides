# Paper Notes

> Penning, A., Baumgärtner, L., Höchst, J., Sterz, A., Mezini, M., &
> Freisleben, B. (2019). \
> DTN7: An Open-Source Disruption-tolerant Networking Implementation of
> Bundle Protocol 7. \
> arXiv preprint arXiv:1908.10237.


## 1. Introduction

- DTN is useful in situations where a reliable connection to a communication
  infrastructure cannot be established
- Messages are transmitted hop-to-hop in a store-carry-forward manner
    - Large time windows between transmissions is possible
    - Next contact might be reached opportunistically, through scheduled
      contact or something in between
- We present DTN7, first and freely available FOSS implementation of the most
  recent Bundle Protocol Version 7, draft ~~13~~ 14 (BP7)
    - General purpose DTN software, several use cases


## 3. Bundle Protocol Version 7

### Network Nodes, Endpoints

- Network nodes are distinguishd from Endpoints
- Node: specific node / peer within the network
- Endpoint: name / URI used for addressing packets (Endpoint ID)
- Nodes might be addressed by multiple Endpoint IDs
- Endpoint IDs might address multiple nodes


### Bundles, Blocks

- Packets are called Bundles
- A Bundle is a sequence of blocks
- 1. block: Primary Block for meta data, e.g, source node, destination, …
- Other blocks are Canonical Blocks, identified by a type code
    - Available Canonical Blocks are Previous Node Block, Bundle Age Block,
      Hop Count Block, Payload Block
- Bundle's last block must be a Payload Block


### Node Components

- Bundle Protocol Agent: offers BP services, e.g., serialization /
  deserialization
- Application Agent: interface between DTN router and a DTN application
- Convergence Layer: exchange / connection between nodes
    - CLAs might be of different quality: {uni,bi}directional, speed, bandwidth
    - Implemented: MTCP, TCPCL (WIP)
    - Possible: only limited by imagination, e.g., Bluetooth, LoRaPHY, Mail, …


## 4. DTN7

- Both library and DTN software written in the Go programming language
    - Supports multiple operating systems and hardware architectures
- Different components are split into separate modules
    - With expandable interfaces, e.g., easy to add new routing algorithm
- Simple RESTful API as an AA to create / fetch bundles over curl or the like
- Peer Discovery (UDP multicast) to automatically add new neighbors
- DTN router's central element is the "processing pipeline"
    - Receive in- and outgoing bundles
    - Store them locally
    - Query a routing algorithm, optionally forward them to a selected subset
      of peers over different CLAs
- Programms are a DTN router `dtnd` and a client for the RESTful API `dtncat`


## 5. Experimental Evaluation

- Executed within Linux Namespace Containers with CORE
- Compare with Serval, IBR-DTN, Forban
- Different Payloads:
    - 64 KiB, compressed image
    - 1 MiB, small image / short audio recording
    - 5 MiB, smartphone image / audio recording
    - 25 MiB, longer audio recording / short video
    - 50 MiB, HD video
    - 100 MiB, 4k smartphone video
- Nodes are connected pairwise with a chain topology
    - Three different lengths: 2 nodes, 32 nodes, 64 nodes
    - Bandwith limited to 54 MBit/s, IEEE 802.11g network
- Results: DTN7 and IBR-DTN are way faster for small files
    - Time converges for bigger files, because of 54 MBit/s


## 6. Conclusion

- Future work:
    - End-to-end crypto
    - Different routing protocols (WIP)
    - More CLAs (WIP)
