# DESIGN-K2SymbolsBrauerPartII — completed planning pass

Issue: #11330. Worker: Codex, session codex-UXYin0. The claim bot confirmed comment 6288959394 at 2026-10-20 10:35:03 UTC. Branch: codex-UXYin0-k2-symbols-brauer-part-ii. One job was taken; no second job is part of this run.

## Deliverables and status

The four issue deliverables are complete: roadmap definition, blueprint packet, independent reader document and compact suggested Lean file. Only those files and this handoff are changed. The scope is exactly the former base-package Layer 14, following the maintainer's 2026-10-20 08:12 correction. Base Layers 1–13 remain suppliers. No unrelated motivic proof programme is added.

The packet is `complete`; KBII.1, KBII.2, KBII.3, KBII.4 and KBII.5 are all `planned`, with empty remaining lists. None is declared closed or implemented. There are 23 nodes: 1 definition, 7 constructions, 15 theorems. They carry 62 API items and 94 Checks in total; the checker counts the required definition/construction subset as 42 API items and 36 unit tests. There are 23 planets, distributed 6/4/5/3/5 across the five layers, 10 read baseline declarations, 14 supplier requests and no additional mathematical gaps.

The reader's scope-conservation table maps every original §14.1–§14.11 target and all Checks, including their repeated strengthened formulations. All API names and test names in the packet occur in the reader. The document is definitive; unavailable heavy carriers are not replaced by artificial objects in Lean.

## Mathematical decisions to preserve

- The general Galois symbol, cohomological Steinberg proof, finite twists, Tate arithmetic proofs and generic Brauer comparison are existing suppliers. The new targets are dictionaries and the specified adapters.
- A primitive root trivializes all integer twists by tensor and dual bases. Its weight-j basis changes by u^j. Brauer contraction changes by u⁻¹, whereas the weight-two scalar coordinate changes by u⁻². The m=5 test distinguishes these.
- The cyclic symbol algebra has a full m² monomial basis even when the radical extension has smaller degree. The proper-degree matrix corner is a separate target. The cup comparison has an explicit carry-cocycle calculation fixing YX=ζXY.
- Arithmetic Frobenius and H_m(a,b)=Art(a)(b^(1/m))/b^(1/m) give the negative invariant coordinate of the ordered cup. Over Q₇, m=3, ζ reducing to 2, β{3,7} has invariant 1/3 while H₃(3,7)=ζ⁻¹. A norm-kernel comparison or a quadratic example alone does not determine this scalar.
- Splitting when μ(F)=μ_m uses the exact order m of the ζ power class and chooses a primitive pairing value, then adjusts it to ζ. It does not import the downstream Moore theorem.
- The conic helper is total. Its all-real negative criterion uses nonpositivity; strict negativity applies to unit inputs. The rational (3,−1), (7,−1), (21,−1) examples disprove global bilinearity.
- Global products include every place, including places above m, dyadic places and real places. At m=1 the real factor is trivial; at m=2 the dyadic and real factors for {−1,−1} cancel.
- Tate's number-field comparison keeps ℓ=2 and real places. The full global-function-field comparison is retained through an explicit M.3 supplier extension. Fraction-field, S-enlargement and residue maps remain actual maps. Picard terms are retained; no mod-coefficient injectivity or arbitrary-scheme generic-point identification is inferred.
- The product-normalized Chern comparison is −h. The raw Hurewicz map gives −εh, hence +h for the newer base package's computed ε=−1. The integral-reduction image is distinguished from the entire finite-coefficient K₂ group.
- Soulé Proposition 2.2.2.3 concerns integral K-products with finite étale cohomology coefficients. His §2.2.3.2 factors the Chern map through finite reduction. No unproved multiplication formula on two arbitrary finite-coefficient K-classes is used, and no product on an arbitrary Moore spectrum is required.

## Supplier requests and maintainer routing

The packet records fourteen precise contracts. Ten are imports or explicit map adapters: CFT Layers 5, 6, 10 and 14; QFI 6C, 6E and 7B; ClassicalArithmeticCompletion CA.1; Motivic M.1 and M.2. Three need extensions/interfaces: Motivic M.3's global-function-field Tate theorem with localization compatibility; GeneralAlgebraicKTheory K.7's finite-coefficient cofiber/reduction/Bockstein/CRT interface; and the independent low-degree branch of Motivic M.8 with finite Chern factorization and signed integral-product compatibility. The last contract imports the newer base package's computed ε=−1 beside older packet IDs that retain ε as a parameter.

The issue's legacy `AlgebraicKTheory` supplier spelling has no current standalone atlas or read-only-roadmap counterpart. The requested finite-coefficient interface is assigned to the existing general K-theory owner, not an invented roadmap.

The maintainer should apply the already-decided move of base Layer 14 to this Part II and retarget consumers, without moving base Layers 1–13. Construction order: early base K₂ → Motivic M.1–M.3 and the independent low-degree M.8 branch → this Part II → consumers. The late Motivic KU-tate2 readiness checkpoint may inspect the completed comparison; it must not become a prerequisite for the M.3 or M.8 constructions. No supplier or consumer file was edited by this job.

The next action is independent review of this completed plan. Before mathematical closure, supplier owners must discharge the explicit contracts. This handoff is not a checkpoint requesting another worker to finish the same planning pass.

## Sources, findings and library audit

Read at the pins: Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 and Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174, including actual statements of the ten baseline declarations. The reviewed T.7 library-coverage audit was read. Current read-only Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 and TauCetiRoadmap main 0d144d044dacebca17b654695b6f1ad58f159b27 were checked for duplication, including the nine roadmaps newer than the snapshot. Current normalized CFT invariant coordinates and generic/quaternion Brauer comparisons are imported rather than planned again. Upstream style exemplars read: ClassFieldTheory and LocalFieldsRamification; QFI 6C/6E/7B supplied the exact imported contracts.

Sources read, with full locators, URLs, hashes and version scope recorded in the packet and reader:

- Weibel, author copy dated 29 August 2013: III.6.2–6.2.5, pp.232–234; III.6.9–6.10.4, pp.240–243; VI.8.6, p.515.
- Milne CFT v4.03: III Proposition 3.6 and Lemma 3.7, p.109; III.4, pp.111–115; V.5, pp.178–179; VII.8, pp.219–222.
- Tate, *Relations between K₂ and Galois cohomology*, Invent. Math. 36 (1976), pp.257–274: the entire published article, read as page images from GDZ. This is not Tate's thesis.
- Soulé, *Groupes arithmétiques et K-théorie des anneaux d'entiers de corps de nombres*, 1978 thesis, author-hosted transcription: Proposition 2.2.2.3 and proof, pp.42–44; §§2.2.3.1–2.2.3.3, pp.45–49.

Four source findings await independent review: E1, Weibel author-copy Lemma III.6.9.1 needs the full minimal-polynomial hypothesis (a Q₅ matrix-over-division-quaternion counterexample is given); E2, Tate's published Lemma 4.1 diagram has H¹ where H² is intended; E3, Weibel's split-surjectivity argument needs a primitive value and its adjustment, not merely a nonidentity value; E4, Soulé's hosted-transcription Proposition 2.2.3.3 has (1−i)! where (i−1)! is intended. The last typo does not affect the degree-one specialization here.

Missing source comparisons are explicit: AMS did not serve the Weibel version of record; the author's linked errata returned 404. E1 and E3 are scoped to the hosted author copy. Soulé's original typescript was not compared, so E4 is scoped to the hosted transcription. A search result mentioned a Collected Works correction list for Tate; that book was not read. No Gille–Szamuely copy was cleared locally, and none was used. Broad Merkurjev–Suslin/Voevodsky proof sources are not represented as read; they belong to the motivic supplier. No restricted files, passages, source excerpts or private filesystem paths were committed. No suspicious external instruction was encountered.

## Verification

- `python3 scripts/check_blueprint.py research/blueprint/packets/K2SymbolsBrauerPartII.json`: zero errors, zero warnings.
- `python3 research/blueprint/intake.py check-files` on all five deliverables: zero problems.
- JSON parsing, scope/planet limits, reader/API/Check-name agreement, source-version records and definition/construction API/test/uses counts checked.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/K2SymbolsBrauerPartII.lean`: passed.
- `lean-check research/blueprint/suggested/K2SymbolsBrauerPartII.lean`: passed at the pinned build. The 55-line file has one real-bodied definition, three theorem admissions and two proved examples; its only warnings are the three expected declaration-admission warnings. Available memory exceeded 20 GB before compilation. No build, update, cache download or language server was started.

The PR URL is written to the worker's external PR marker when opened. No second issue will be claimed. Scratch source copies and working notes are deleted after submission; this handoff retains everything needed for review and supplier routing.
