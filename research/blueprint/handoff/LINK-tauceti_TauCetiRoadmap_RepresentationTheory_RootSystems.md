# RootSystems link audit — submission handoff

Worker: **ChatGPT Pro — cgp-3dc7b31740c5**  
Job: `LINK-tauceti_TauCetiRoadmap_RepresentationTheory_RootSystems`  
Issue: #64  
Status: **complete catalogue screen; awaiting independent review**, not mathematical or implementation acceptance.

## Result and authorized files

The packet records **21 new outgoing links, no incoming link established, seven overlap proposals, and 212 examined other roadmaps**. The partner roadmaps are CFSGStatement, ReductiveGroups, LieHighestWeight, ClassicalGroups, QuiverRepresentations, LieGroups, IntegralLattices and SpinRepresentations. The affine-diagram link already recorded by ZigzagPreprojective and the numbered spin-data link already recorded by the Spin worker are referenced rather than duplicated. Five proposals recommend rescoping and two recommend keeping distinct responsibilities. No whole-roadmap merge is recommended.

The only repository outputs are:

- `research/blueprint/links/tauceti_TauCetiRoadmap_RepresentationTheory_RootSystems.json`
- `research/blueprint/handoff/LINK-tauceti_TauCetiRoadmap_RepresentationTheory_RootSystems.md`

The claim comment is #64 comment **5696751120**, accepted for this exact session by bot comment **5696753011**. Rechecks found no competing claim. The isolated branch is `browser/cgp-3dc7b31740c5/root-system-links`. A working checkpoint was saved before completion. No other job was reserved during this audit.

## Revisions and provenance

Initial repository revision: `49f74b4d2bace99a76ceff4ac2199a3384c83c57`. Branch base and first full input snapshot: `7821d19ab4fd547181beb46287f8968ec64847d1`, obtained through GitHub Pages workflow run `35091187921`, artifact `10444087116`. The oversized atlas could not be downloaded through the ordinary contents endpoint; the authorized artifact supplied the actual file, whose Git blob was checked.

The protocol and submission-input refresh was `1338883fe31f3b357dd91b7d5916e76e3b950c81`, workflow run `35093449521`, artifact `10445750299`. It added the link-status requirement, MordellLawrenceVenkatesh and three other link packets. The final pre-submission graph refresh was **`0bc5cf052b240a1ec91e059d47b5c18a7c3976e5`**, workflow run `35094882245`, artifact `10445772807`. It contained eight other link packets. The atlas, every quoted source file, baseline, browser instructions, blueprint protocol and link validator were byte-identical between the latter two snapshots. The RootSystems output was absent from that main snapshot before the local validation copy was added.

Source fingerprints:

- Atlas: `37f2add06983c206067d1104e0f40a839cc3961a` — identical in all three snapshots.
- RootSystems README: `fc1bff4cd954b0617de509b7ceac8d7a96fa5d08`.
- Upstream roadmap snapshot: `faa5423b925964415cc926802ab206567719d3f4`.
- Current link validator: `88135efe5a74ef82e088f3fa3189893e27a7867a`.
- Blueprint protocol: `41099c03ea64d701d05b1277a83141ef9d4868db`.
- Browser instructions: `e4854be9cb94f4e9fe6f4ac76a5468f56c53d3a0`.

Library pins read from baseline.json: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. **No declaration-level availability or proof audit was performed.** Names quoted from roadmaps are planned contracts, not claims of implementation at these pins. No external-book theorem verification or Lean build is claimed.

The uploaded packet commit is `c1d995b304cca7ca73392a71ec733d13744b63cd`. Its Git blob, fetched after upload, is **`b2e02f329cb5d14b7003b9acd97774f6f8b0c755`**, matching the locally validated 74,578 bytes. Its SHA-256 is **`1fb493924a4d76712519ed472ecbbbf82e36b3b10e8c1b6b8a15af113db7078a`**.

## Coverage and source method

Read the complete RootSystems document and all its stages, the complete ReductiveGroups and QuiverRepresentations documents, all catalogue titles and summaries, and every retained candidate's complete endpoint stage descriptions. Search covered every roadmap document and all 1,968 stage records, using root systems/data, RootPairing, Coxeter, Matsumoto, exchange, Dynkin, Cartan, Bourbaki, Weyl, coroots, chambers, positive roots, braid, Bruhat, ADE and lattice terminology. Matching contexts were examined; 45 roadmap documents including the target were keyword candidates. All 59 other upstream roadmaps and the same/neighboring areas were screened. Screening is not a claim to have read every line of every unrelated roadmap.

Detailed candidate reading included highest-weight conventions and Layers 0–9, CFSG I0 and carrier/Steinberg stages, ClassicalGroups Layer 3 and its conventions, LieGroups Layers 6–9, Spin Layers 5 and 8, IntegralLattices Layer 5, Zigzag Layers 0 and 8, GrothendieckEulerForms Layer 5 and its examples, and all stages of ReductiveGroupsPartII and AdelicAlgebraicGroups. The new Mordell roadmap's scope and stage descriptions, especially LV.0/LV.9, were checked at refresh; its explicit exclusion of the later reductive-group-combinatorics scope prevents inventing a RootSystems edge from the word symplectic.

Every new arrow has two raw verbatim excerpts with repository-relative source paths and one-based line locators. The issue-specific confidence rule is recorded in provenance: explicit when a text names the other roadmap/stage, inferred for an exact unnamed output/use match. Each examined record states its result or explains the rejected vocabulary match. In particular, K2 Matsumoto, Schwartz–Bruhat functions, Weyl equidistribution criteria, monoidal braiding and polynomial simple roots are not treated as root-system dependencies.

## Stage input/output audit

**Layer 1.** Input: finite reduced crystallographic root pairing in the characteristic-zero setting, chosen base, and the root-spanning hypothesis wherever the finite automorphism action needs it. Output: finite positive roots, ordinary positive-root lowering, inversion sets, root-level exchange and finite Weyl group. It does not supply general weight lattices, Kostant partition finiteness or sink-admissible quiver lowering.

**Layer 2.** Input: that pairing/base, Layer 1 and the integer pairing restrictions. Output: Coxeter matrix, simple-reflection product orders, generation, the Coxeter presentation of the existing Weyl group, and length equals inversion count. The type-A worked comparison gives adjacent transpositions. These do not construct Schubert cells or prove Bruhat decomposition.

**Layer 3.** Input: an abstract Coxeter system, not necessarily a finite crystallographic one. Output: strong exchange, deletion, Matsumoto, reduced-word independence and the stated Bruhat/Poincare interfaces. No new inter-roadmap edge was established merely because another roadmap uses braids. No unpromised exponent or Coxeter-number API is assumed.

**Layer 4.** Input: the reduced finite root geometry over real/allowed ordered coefficients, positive form and Weyl theory. Output: chambers, dominant cone, dominant representatives, interior uniqueness and longest-element properties. For highest weights, a rational/real realization and regular lambda+rho are required; an arbitrary coefficient field is not embedded into the reals. Interior uniqueness is not a proof of the stronger closed-boundary uniqueness advertised in the surrounding prose. Nonreduced restricted roots need a separate comparison.

**Layer 5.** Input: finite reduced crystallographic characteristic-zero root data, bases, integral Cartan matrices and positivity. Output: early DynkinType/Valid/rank/matrix interfaces, explicit models, and the later finite-type classification. Oriented Cartan matrices distinguish B from C. Enumeration/model consumers need not wait for the exceptional classification summit, and low-rank validity predicates must be preserved.

**Layer 6.** Input: the finite-type enumeration and explicit-data prefix. Output: fixed Bourbaki labels, named simply connected integral root data and bases on Fin carriers, coordinate bases, root counts and long-simple-root labels. This is not general weight-lattice theory, a GL_n central character datum, a group scheme, or a promised D4 automorphism theorem. Do not silently add the spanning-root-system mixin over Z or after reduction modulo p.

## Remaining mathematical and ownership work

1. **General lattices and rho.** RootSystems assigns these to LieHighestWeight, whose conventions assign them back. Agree an early general lattice unit: Q/P and their duals, Weyl stability, integrality, fundamental weights, rho(alpha_i^vee)=1, and real realization. Keep the concrete type-indexed Layer 6 data separate and compare them later. Do not create a cycle through representation classification.
2. **GL_n and isogeny forms.** ClassicalGroups must own the diagonal torus with character lattice Z^n, central character, restriction to SL_n and comparison with A_(n-1). The semisimple finite-root catalogue is insufficient by itself. Connected SO/Sp and disconnected O representations remain distinct.
3. **Quiver generality.** Kernel/cokernel reflection functors apply beyond finite ADE; the finite Coxeter comparison must be a restricted subunit. Sink-admissible descent is stronger than arbitrary simple-root lowering and remains a consumer lemma. General indefinite/Kac–Moody root realizations are not supplied here.
4. **Restricted and closed chambers.** LieGroups needs a reduced-subsystem comparison preserving hyperplanes, Weyl action and cones before applying the reduced chamber results to possibly nonreduced restricted roots. Closed-boundary uniqueness also needs its own proof where used. The new HW7 arrow uses only regular interior representatives and explicitly retains rho/discreteness/comparison obligations.
5. **D4 triality.** Share the cycle (0 2 3), its exact order, Cartan preservation, lift to the named simply connected root datum and action on fundamental weights. RootSystems currently promises the numbered data but not that complete theorem. CFSG already owns pieces in I0/L1; coordinate their extraction with the Spin worker's proposal. ReductiveGroups owns pinned-group lifting; Spin owns transport to its Clifford carrier. A graph symmetry alone is not group-level triality.
6. **ADE lattices and E8.** Keep primitive numbered coordinates independent of downstream discriminant/gluing classification. IntegralLattices owns actual integral submodules, duals, half-norm discriminant forms and the D8+ Gram isometry. A root lattice is the Z-span of roots, not the entire ambient weight lattice. Any reuse of completed lattice code requires a separate pinned-source audit of the independent prefix.
7. **Euler-form conventions.** Keep generic categorical Ext-Euler descent independent of root classification. The E8 acceptance comparison must distinguish a composition-factor Cartan matrix, E=I-A and its symmetrization 2I-(A+A^T), including the left-module transpose convention.

The packet also explicitly retains each consumer's proof obligations: discrete weight support and convex-hull bounds, root/group Weyl comparisons, normalizer quotients, pinning and group-scheme constructions, Schubert-cell coordinates, integral-to-real comparisons, and low-rank adapters. A dependency edge supplies an input, not the consumer's proof.

## Concurrent submissions and deduplication

At the protocol refresh the Zigzag packet already recorded RootSystems6 -> Zigzag0 and the finite/affine overlap. Both were removed from this packet's new arrays and retained in `alreadyRecorded`.

PR #529, worker cgp-797896f1d145, was checked at head `854ab41d74aff64f80a2e67ab260331dafdf805a`, packet blob `cbe898782abf01ecd30fed0acfed9bc42eb1ee37`. All 18 edge records and the relevant overlap records were read for coordination, not reviewed or approved. Its RootSystems6 -> Spin5 edge was removed here. The separate RootSystems5 -> Spin5 realization contract remains. PR #529's data-only RootSystems6 -> Spin8 does not claim the missing automorphism theorem. Its triality rescope should be coordinated with this packet rather than spawning duplicate requests.

By the final 0bc5 snapshot, the Spin packet had been copied into main; its 18-arrow graph agreed exactly with the earlier PR projection. All eight other live packets were included in final cycle/duplicate checks. Presence in main as a submission is not asserted to mean independent mathematical approval. The historical `alreadyRecorded` provenance in the JSON remains tied to the snapshot at which that duplicate was discovered.

## Validation actually performed

From the complete refreshed repository snapshot, with the unmodified current validator:

```sh
python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_RepresentationTheory_RootSystems.json
```

**PASS at 1338883 and again at 0bc5cf0:** status complete; 21 links; seven overlaps; 212 examined; **zero errors and zero warnings**. One invocation initially used the scratch parent rather than the extracted repository and failed to locate the script; it was corrected, and the successful final invocation used the repository root with pipefail enabled.

Supplemental checks passed for 21 unique nonduplicate arrows against all recorded stage edges and eight other packets; 42 exact raw excerpts and line locators; 212 unique examined records equal to the full other-roadmap catalogue; overlap incidence; unchanged source/protocol fingerprints; and byte equality of the uploaded packet. An earlier supplemental run also passed the actual check_links.check function with the exact 18-arrow PR #529 projection before that file reached main.

This is structural, evidence and dependency-graph validation, **not independent mathematical acceptance**. No GitHub CI pass is claimed in this handoff; the repository's PR workflow does include link validation. No Lean implementation/build or external theorem verification was run. No git command, unrelated-file change, default-branch push, merge, approval, issue closure or done-state action was performed.

## Review handoff

Review the 21 arrows and seven proposals independently, focusing on the scope restrictions above. Resolve the generic lattice/GL_n/triality ownership requests with the adjacent roadmap owners; reuse the existing Zigzag and Spin submissions rather than duplicate them. Only the maintainer/orchestrator should integrate accepted links into the atlas. The worker must not unclaim merely because this completed submission awaits review.
