# Independent verification of RT-PAPER-NGODAC-21

Codex, session `codex-J6LwjP`, 2 October 2026. Refs #4078. The bot confirmed
claim comment 5945334328 before work began. I did none of the Ngo Dac paper
extraction, its independent paper review, or this red team. I previously fixed
the sibling Im–Kim–Le extraction: its current routing is evidence for the
cross-paper conflict, not work independently approved by this verification.

**All 18 findings checked: 17 confirmed, /17 rejected.** The confirmed findings
comprise four high, six medium and seven low findings. The machine-readable
review gives a separate reason and qualified fix for every finding. This job
does not change the paper extraction, its routes, the atlas or any packet.

## Sources actually checked

The main source was freshly downloaded from the public HAL manuscript on
2 October 2026. Its hash agrees with the extraction/red-team source. This is
a targeted verification at the findings' locators, not a new complete reading
of the paper or the final Annals version. Printed pages 3–9, 16–18 and 20–24
were consulted; page images additionally checked the polynomial codomain,
period normalization and coefficient/linear-independence statements on
printed pages 17–18.

| Public version | Locators checked | SHA-256 |
|---|---|---|
| [Ngo Dac, HAL manuscript](https://hal.science/hal-03298790/file/ZagierHoffmanHAL.pdf), 27 PDF pages including cover | Main theorem statements; canonical product recursion and Corollary 2.7; analytic setup, Anderson–Thakur polynomials, lifting argument; prefix/suffix closure and small-weight proof | `f6bf74f188aad7602293e47b2c963243a036649cb591a4dc7ca13556e90d971d` |
| [Chang, arXiv:1207.2326v4](https://arxiv.org/pdf/1207.2326v4), 20 pages | Theorem 2.2.1 (p.5, also image checked), (3.1.3) and §3.2 (p.7), Theorem 3.4.5 (p.9), Theorem 4.3.1 (p.12), Lemma 5.3.1 (p.14), Theorems 5.5.1/5.5.3 (p.18) | `d2a8138a6d45dc8f826a60f1c24528342cdb7a8fb3f2bc90d0f2a7db9955ddcc` |
| [Papanikolas, arXiv:math/0506078v2](https://arxiv.org/pdf/math/0506078v2), 39 pages | Lemma 3.3.2 and §3.3.4 (p.12), §4.1.6 (p.22) | `6b5d3436da4d309fa77de77d23a0ed1781ee7fe90c544e55a229ef5cae026cf3` |
| [Chang–Papanikolas–Yu, arXiv:1411.0124v2](https://arxiv.org/pdf/1411.0124v2), 32 pages | Proposition 2.2.1 and proof, §2.3 (PDF p.6), application in §3.2 (PDF p.11) | `029b57501d8b37f292557044ab2789b30435ab0c8e4b6d739284ee94ec7c5549` |

No fresh complete reading of Thakur's or Kuan–Lin's original paper is claimed.
For the related findings I checked the HAL restatements, exact extraction
items and sibling routes. The mathematical statements under examination are
not certified by a search result or by the red team's assertions alone.

## Routing and dependency findings

Read the named items, all six Ngo Dac routes, its paper-review verdicts,
G3–G8, the sibling Im–Kim–Le and Chang–Chen–Mishiba routes/review decisions,
the DM.0/1/2/4/5/6/8 layer contracts, relevant reviewed AUDIT-20 coverage and
the DM.0/8 partial packets. Also checked the actual route-consumption logic
in `make_queue.accepted_routes` and `paper_designs`.

Fresh assembly at repository commit `8ca8363` gives **2,956 actual stages and
8,563 distinct stage dependency edges, acyclic**, using stageEdges and requires
with actual stage endpoints. DM.2 and DM.4 each precede DM.8, and neither
reverse path exists. Part II is not yet a live map/packet definition. Thus
/1 and /4 identify cycles that the proposed import/ownership combination
would force, rather than an already cyclic assembled atlas.

The corrections must coordinate the owners, rather than reproduce mutually
inconsistent intermediate suggestions in the red-team fix text:

- /1: move the aggregate factorial and small-power-sum items into the shared
  Part II and remove the DM.6 route/import. DM.6 is the Taelman class-number
  layer. An explicitly split scalar factorial could have an early rank-one
  owner, but tuple products belong with the index construction. Refresh
  positional route-review verdicts when deleting a route.
- /2 and /4: coordinate one supplier for specialized E, Omega, the CPY
  denominator lemma and Carlitz products. The recent Im–Kim–Le fix already
  imports ordinary Tate theory from upstream AdicSpaces Layer 0; do not
  describe its renamed historical item as a second generic Tate algebra.
  Split algebraic inverse Frobenius for DM.4 from analytic twisting/E in
  DM.8, keeping Omega with the latter. A DM.2 period-power theorem needs an
  explicit Carlitz product/root supplier if its Omega dependency is removed.
  No DM.8-to-DM.2/4 edge is justified. The new Chang–Chen–Mishiba routes 3/4
  lack matching accepted positional verdicts and are only coordination leads.
- /5: the scalar descent/degree inputs belong with their Part II consumer;
  compare the generalized monic-subring statement with sibling specializations
  before identifying them. /18: Part II imports ABP as a theorem; its generic
  analytic/Riemann–Roch proof internals belong to the supplier. G8 is a source
  version availability issue, not a mathematical proof leaf.
- /10: the fraction-field fixed-field lemma is required for the broad
  trivialization comparison. The DM.8 packet is partial, without an accepted
  review, and lists this interface in `coverage.remaining`. That is a promised
  supplier, not an accepted completed node. The manuscript's narrower triangular
  proof using Tate-algebra fixed elements does not prove the broader item.

The actual item graph has **112 nodes and 266 internal edges**, against the
stored 106-node/260-edge audit. All four `rev-*` items are isolated. Adding
the canonical recursion/dominance, closure and fixed-field connections
suggested for /6, /9 and /10 together preserves acyclicity on all 112 items.
Canonical choice is essential: existential product expansions alone do not
define Todd's maps when uniqueness is open. The API/test additions are useful
blueprint commitments, but their absence alone does not block paper extraction
under PROTOCOL §16.

## Mathematical and library checks

For /3, direct enumeration at q=3,w=4 yields five small-entry indices versus
six Thakur indices (the latter include (3,1)). The brief cannot derive D from
A/B alone. It must distinguish Corollary C, Theorem 6.2's range and Lemma 6.1's
count before applying A. For /7, HAL and Chang use pi=1/Omega(theta), whereas
Papanikolas and the DM.8 request use pi_P=-1/Omega(theta). Both conventions
are valid; the existing item's compatible-period statement is correct.
Name the transport, including (-1)^w, rather than report a source error.

For /8 the source explicitly exports alpha_n in A[t], which the extraction
omits. The q=2 generating-coefficient check gives alpha_3=theta+t^2 and
H_3=t+theta^2. For /12, Delta_2(2,2)=-2=1 in F_3, while the actual test still
says 2. For /13, equal-exponent Chen coefficients cancel in characteristic
two, so the claimed converse fails even when 2a>q (checked q=2,a=2 and
q=4,a=3). The canonical recursion also gives trunc(1,1)=[2] for q=2,
trunc(1,1)=[2]+2[1,1] for q=3, and fix(2,2)=[4]+[2,2] for q=3.

For /14, the proposed binary-relation non-example cannot exist under the
stated positive-weight K-coefficient hypotheses: summing the nonnegative
equations expresses the surviving d=-1 constant as a positive-weight MZV
combination. Chang's Theorem 2.2.1 separates this span from 1, forcing that
constant to zero; lower negative degrees vanish automatically. Keep the
source's all-integer definition and test its actual boundary. For /16, the
proof uses lower-weight barK-linear independence, not algebraic independence.
For /11, direct counts are 112 items (5 library, 4 planned, 103 missing) and
16 sourceIssues, inconsistent with the opening summary.

Pinned checkouts were verified at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. For /15 I read the relevant full
statements in Mathlib's PowerSeries/GaussNorm and Polynomial/GaussNorm files
and Tau Ceti's PowerSeries/GaussNorm file, including
`TauCeti.PowerSeries.hasGaussNorm_of_isRestricted` and
`gaussNorm_mul_of_isRestricted` with their actual normed, ultrametric and
multiplicative-norm assumptions. I also read
`TauCeti.Huber.completeSpace_weightedRestrictedSubring_one_weight` and its
surrounding hypotheses/comparison in WeightedRestrictedSeries/Complete:
generic restricted-series completeness already exists over a complete uniform
nonarchimedean commutative ring. The remaining specialized work is the
C-infinity instance and comparison between the unit-radius Gauss model and
the Huber restricted-series topology, not an entirely missing completeness
theorem. Import upstream AdicSpaces Layer 0 §§0.4–0.5; do not infer entire/ABP
theory from Gauss norm alone. No Lean adapter was compiled.

## Rejected finding /17

The Omega item already asserts Omega in E; the definition of E already
requires barK coefficients. Papanikolas §3.3.4 and Chang §3.2 explicitly
supply that membership. The coefficient recursion
theta^q c_n^q+c_n=c_(n-1)^q is a valid future proof of algebraicity, but there
is no omitted extraction statement or incorrect hypothesis here. PROTOCOL
§16 says that cited results are extracted without proving/decomposing them,
and assigns proof closure to their owning blueprints. The existing G5 records
those deferred analytic suppliers. This optional proof detail is therefore
rejected as an extraction defect; /4 covers the genuine ownership problem.

## Validation

Checked exact equality and uniqueness of the 18 input/review finding ids,
verdict/severity totals, `scripts/check_redteam.py`, deliverable-path intake
and `git diff --check`. No library build, Lean language server or new Lake
project was started. This review has no suggested Lean file to elaborate.
