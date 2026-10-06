# Handoff: BP-EulerSystemsAndKolyvaginSystems--ES.0

Agent: Claude (Claude Opus 5.5) — session `claude-NX8bF9`. Refs #723. Date: 6 October 2026.

Deliverables of this job:

- `research/blueprint/packets/EulerSystemsAndKolyvaginSystems--ES.0.json`
- `research/blueprint/readmes/EulerSystemsAndKolyvaginSystems--ES.0.md`
- `research/blueprint/suggested/EulerSystemsAndKolyvaginSystems--ES.0.lean`
- this note

## Status

The packet is `complete`: a first pass at target level over all eight layers in scope, ES.0–ES.7.
Every layer is `planned` (every target the layer states is a node whose prerequisite chains end in
the pinned libraries, in a node or requested layer of another roadmap, or in a recorded gap), and
every layer carries a `remaining` list of refinements. No layer is `closed`.

| | |
| --- | --- |
| Nodes | 84: 30 definitions, 10 constructions, 31 theorems, 7 lemmas, 5 applications, 1 comparison |
| API items / unit tests | 250 / 153 |
| Planets | 35 (ES.0: 6, ES.1: 3, ES.2: 3, ES.3: 5, ES.4: 5, ES.5: 5, ES.6: 4, ES.7: 4) |
| Baseline declarations cited | 19 (13 Mathlib, 6 Tau Ceti), each read in its source file at the pinned commits |
| Requests | 5 |
| Gaps | 4 |
| Source mistakes recorded | 1 new (a misprint in Burns–Sakamoto–Sano II, Hypothesis 4.7(ii)) |

Checks run:

- `python3 scripts/check_blueprint.py` on the packet, with the declaration index of the pinned
  libraries: 0 errors, 0 warnings.
- Every source excerpt in the packet (175 of them) was checked mechanically to occur in the text
  extracted from the PDF it cites, ignoring whitespace and hyphenation.
- No API or test name occurs twice; every prerequisite inside the roadmap resolves; the graph is
  acyclic (checker).
- The document is generated from the packet, so the two agree by construction; it was scanned for
  the scope words the protocol excludes.

## The suggested Lean file

Compiled with `lean-check` in the shared build (Mathlib `082e2d3`): exit status 0, and the only
warnings are 49 `declaration uses sorry`.

It has two parts.

1. A typed algebraic core, which the pinned Mathlib can state: Selmer triples over abstract
   cohomology modules, conductors, the cartesian square, the scalar morphisms of `Quot_R(T)`; the
   quotient polynomial of the finite–singular comparison; exponent and order functions; Euler
   polynomials of an endomorphism in the two conventions; the module of Euler systems of an abstract
   norm-compatible tower as an equaliser, with its universal property; the norm element and the
   Kolyvagin derivative in a group ring with the telescoping identity; sheaves on graphs, sections,
   subsheaves, locally cyclic sheaves, hubs, primitive sections and the conductor graph; the exterior
   bidual with the canonical map and functoriality; Stark systems as an abstract inverse limit.
   64 of the packet's 403 API items and unit tests have a signature here.
2. A second part listing every node of the packet with its statement and every API item and unit
   test under the name the packet gives it. 339 items are recorded there as comments and not as
   Lean declarations.

**This is the main limitation of the file.** The arithmetic statements are about continuous Galois
cohomology of `p`-adic representations, local conditions, Selmer structures and their duals. Those
carriers are planned in `SelmerIwasawaCohomology` L1–L3 and `ArithmeticGaloisDuality` R02 and are
not in the pinned libraries. I did not replace them by `Prop`-valued fields or by opaque stand-ins,
so those items are not type-checked. A reviewer should read the typed part as checked signatures and
the second part as an index. No `TauCeti.*` module is imported: the shared build is on a later
commit of Tau Ceti than the pin, and the only Tau Ceti declarations the typed part would use
(corestriction on `H¹`) are taken as data of the abstract tower.

## How the binding inputs were handled

**Restructuring RS-04** is accepted; it keeps this roadmap unchanged, makes ES.1, ES.3, ES.4, ES.5
the owners of the generic finite–singular comparison, corrected derivative construction,
error-tolerant descent and primitivity, and records links ES.1 → HE.5, ES.4 → HE.6, ES.8 → HE.8. The
packet follows it.

**Library audit** (`data/library-coverage.json`): all eight layers are "not built". The duplicates it
flags are resolved by importing, not re-planning: Selmer data, propagation, orthogonal complements
and dual structures from `SelmerIwasawaCohomology` L1–L2; the Greenberg–Wiles formula from
`ArithmeticGaloisDuality` R02.5. The audit says that neither library defines Fitting ideals; this was
confirmed in the index, and Fitting ideals are requested from `PadicMeasuresIwasawaAlgebras:L6`.

**Red-team finding RT-AREA-iwasawa-1/10** (Howard's self-dual theory had no owner). ES.5 is now its
single owner, with four generic nodes: `ES.5/howard-hypotheses` (H.0–H.5 and the Kolyvagin-system
relations twisted by `G_n`), `ES.5/cassels-structure` (Proposition 1.4.1, Theorem 1.4.2, Lemma
1.5.3), `ES.5/howard-stub` (Proposition 1.5.9) and `ES.5/howard-dvr-theorem` (Theorem 1.6.1). The
Λ-adic Theorem 2.2.10 belongs to ES.8, which is outside this job's scope; it is named in the
`remaining` list of ES.5 and in the `restructure` entry, for the ES.8 part to plan. The stage edges
the finding asks for (ES.5 → GH.5, ES.8 → GH.5, HE.6 → HE.8) are proposed in `restructure`; a packet
cannot add edges.

**Red-team finding RT-AREA-iwasawa-1/36** (adapters without an edge from this roadmap). The carriers
the adapters import are planned here: the request of `EulerSystemsCyclotomicMainConjecture:L0` to
ES.2 is met by `ES.2/euler-system-module`, `conductor-presentation`, `euler-polynomial` and
`twisting`; its request to ES.4 by `ES.4/rubin-hypotheses` and `ES.4/rubin-bound`. The edges
ES.2 → ECMC:L0, ES.2 → KatoEulerSystems:L2, ES.4 → KatoEulerSystems:L4 and ES.8 → KatoEulerSystems:L4,
and the two edges to drop, are proposed in `restructure`. The requests to ES.8 (Rubin II.3.2–II.3.4,
Kato's Theorem 13.4) are for the other part.

**Sources added by the maintainer.**

- *Dasgupta–Kakde §1.2* (items 27–33): `ES.6/rubin-lattice` (the unit group `U_{S,T}`, `ord_G` and its
  bijectivity, Rubin's lattice), `ES.6/exterior-bidual` (the lattice form of the bidual),
  `ES.7/rubin-brumer-stark` (the element and Rubin's conjecture as a proposition with no instance).
  Theorem 1.6 stays with `IntegralIwasawaTheory:I.7`, as the route says.
- *Liu–Tian–Xiao–Zhang–Zhu §§2.1, 2.3, 2.4, 2.6*: `ES.1/reducibility-depth`,
  `ES.1/selmer-field-saturation`, `ES.1/abundant-tuples`, `ES.4/abundant-localization`. The nodes
  state the corrected Lemma 2.6.4 and Propositions 2.6.6–2.6.7 (register entries
  PAPER-LIU-ETAL-22/E1, E2, E23), with a concrete matrix showing why the printed linear-algebra step
  fails. The eight finer repair items (S23-closure … S24-bounded) are not separate nodes; they are
  listed in the `remaining` of ES.1.
- *Castella–Grossi–Lee–Skinner §3* (items 18–23): one node, `ES.4/howard-descent-with-errors`,
  stating Theorem 3.2.1 with its constants and its two inputs. Item 24 (Λ-adic) is for ES.8.
- *Kolyvagin / Rubin's book*: the universal Euler system with freeness and Ext-vanishing
  (`ES.2/universal-euler-system`), the induced module and connecting map
  (`ES.3/lifting-to-induced-module`), derivative classes and their local behaviour, the congruence
  (`ES.3/congruence`), the Chapter IX variants (`ES.2/rigidity-variants`, `ES.3/anticyclotomic-derivative`,
  `ES.4/variant-bounds`), Appendix A Corollary 2.6 (inside `ES.4/rubin-bound`). The finer items of
  the route (IV §6–§7 lemmas, Lemma IV.7.3, Proposition IV.6.8, Lemma V.3.2 as its own node) are
  cited in proof sketches and listed in `remaining` for lemma level. Kolyvagin's article itself is
  not public and was not read (recorded as a gap).

## Requests made to other roadmaps

1. Tau Ceti `ClassFieldTheory`, layer 12: existence of ray class fields with their Galois groups.
2. Tau Ceti `ClassFieldTheory`, layer 7: the local Artin map on tame inertia and local duality for
   finite unramified modules.
3. Tau Ceti `Chebotarev`, layer 10: the density theorem.
4. `PadicMeasuresIwasawaAlgebras:L6`: self-injectivity of `R/(p^m)` for a Gorenstein order, exact
   duality, reflexivity, Fitting ideals with their determinantal description.
5. `SelmerIwasawaCohomology:L2`: Selmer structures and the global duality sequence over a general
   complete noetherian local coefficient ring (its nodes are stated for the integers of a `p`-adic
   field).

Requests 1–3 name Tau Ceti layers because the checker asks for a request entry for any layer of
another roadmap; they ask nothing of Tau Ceti beyond what those layers state.

## Gaps

1. The comparison between Mazur–Rubin's Stark systems (exterior powers) and Burns–Sakamoto–Sano's
   (exterior biduals) over principal artinian rings was not located in what I read.
2. Rubin IV §§6–7 and V §2 were read at the level of statements.
3. Burns–Sakamoto–Sano II §5.4 and §6.5 were not read; so the exact correction formula in rank `r`
   is described, not displayed, in `ES.7/higher-kolyvagin-derivative`, and the accepted 2025 version
   was not compared with arXiv v1.
4. Kolyvagin's article was not read.

## Sources

Read (PDF hashes are in the packet; all fetched 6 October 2026): Mazur–Rubin, *Kolyvagin systems*
(authors' copy, via the Internet Archive, since the authors' server did not answer); Rubin, *Euler
systems* (1999 draft); Mazur–Rubin, arXiv:1312.4052v1; Burns–Sakamoto–Sano II, arXiv:1805.08448v1;
Howard, Compositio 140 (published); Dasgupta–Kakde, arXiv:2010.00657v3 §1.2; Liu–Tian–Xiao–Zhang–Zhu,
arXiv:1912.11942 §2; Castella–Grossi–Lee–Skinner, arXiv:2008.02571v2 §3. The `readSections` of each
source say exactly what was read in full and what only in statements.

Downloaded and not read: Burns–Sano I (arXiv:1612.06187v1) and Burns–Sakamoto–Sano III
(arXiv:1902.07002v1), which the roadmap's document names as principal sources. Nothing in the packet
cites them.

Statements quoted from the published Mazur–Rubin memoir and from the published versions of the
arXiv papers were read in the author copies and preprints named above, not in the versions of
record.

## Things a reviewer should look at first

- `ES.0/hypotheses-implications` parts (c) and (e), and the API item `MR16Hypotheses.of_mr04`,
  compare the 2004 and 2016 hypothesis records and Rubin's Hyp(K, T). The sources do not state these
  comparisons; I derived them, and the node says so. They deserve an independent check.
- Several unit tests are computations I made, not quotations: the non-cartesian condition on
  `ℤ/p²`, the bidual of a trivial module over `ℤ[G]` (index `|G|^{r−1}`), the matrix
  `(λ, 1; 0, λ)` for the abundant-tuple correction, `I_ℓ = (ℓ + 1, a_ℓ)` at an inert prime.
- The misprint recorded as `EulerSystemsAndKolyvaginSystems/E1` is against arXiv v1 only.
- The statement of `ES.1/abundant-tuples` and `ES.4/abundant-localization` relies on the reviewed
  extraction of Liu–Tian–Xiao–Zhang–Zhu for the corrected forms; I read the printed statements and
  the first lines of the proofs, not the proofs.

## Where to resume

The follow-up for each layer is its `remaining` list in the packet. In order of value:

1. Read Burns–Sano I and close gap 1; read Burns–Sakamoto–Sano II §6.5 and display the rank-`r`
   correction formula (gap 3).
2. Nekovář's error-tolerant two-prime descent and Kolyvagin's Theorem A, which
   `HeegnerPointEulerSystems` HE.7 requests from ES.4: their sources are not among this roadmap's and
   were not read.
3. Type more of the suggested file once the Selmer carriers exist.
4. ES.8 (the other part of this roadmap) plans Howard's Theorem 2.2.10, Rubin II.3 and the Λ-adic
   items of the routes.
