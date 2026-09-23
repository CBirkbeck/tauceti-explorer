# Independent review: Schur–Weyl links

**Verdict: accepted after correcting O5 and clarifying L9.** All ten dependencies and seven overlaps are retained. The semisimple image-bicommutant theorem already exists at the pinned baseline: O5 now requests reuse instead of reconstruction. Five subsequently introduced roadmaps are added to `examined`, giving 217 other roadmaps. No dependency was added or removed.

Reviewer: Codex, session `codex-c83e7a`, job `REV-LINK-tauceti_TauCetiRoadmap_RepresentationTheory_SchurWeyl`, issue #132, 2026-09-23. The original author was ChatGPT Pro, session `cgp-8384bdb1c668`, whose work entered through PR #608; this reviewer did not write that packet. Claim comment 5797811102 was confirmed by the bot before work began.

## Inputs and scope

Read PROTOCOL §§9–10, the current packet and its handoff, every full endpoint stage of all links and overlaps, and all ten SchurWeyl stages. Review used atlas and supplemental roadmap/link inputs at repository commit `386e065b82a671bb88a50867b4f28fd6dccaa4c2`: 218 roadmap documents and 2007 stages. The input packet blob was `534c837cdd6f3714155b2f68233d961e2d1d8c0a`. The cached supplemental roadmap/link files exactly matched the snapshot's file set. Before publication, two concurrently changed link packets (SemisimpleAlgebras and ZigzagPreprojective) were refreshed at `2eae58ee83bfd53d4515306eb8bde282fda5a175`, and validation was repeated. The former prompted direct baseline verification and the O5 correction below. The atlas and stage texts were unchanged.

In the tables below, SW, CT, CG, IR and SA abbreviate the SchurWeyl, CharacterTheory, ClassicalGroups, InductionRestriction and SemisimpleAlgebras roadmaps. Numbers identify their layers. L1–L10 and O1–O7 identify array positions in the reviewed packet, which retains the complete canonical stage identifiers and evidence strings.

## Every dependency

For each row I checked both full stage descriptions, the actual output/input match, prerequisite-to-consumer direction and both evidence quotations. All **20 quotations are literal substrings of their named stage descriptions**, without whitespace normalization. Their relevance is the contract stated below. Existing explicit/inferred classifications are retained.

| Link | Decision and verified boundary |
|---|---|
| L1: IR2 → SW1 | Retain, inferred. Induction of the trivial representation equals the left-coset permutation representation, specialized to the rational Young subgroup. Ordered blocks, tabloids and the factorial index remain SW1 work. The later Young-rule example is not an input to generic induction. |
| L2: CT2 → SW4 | Retain, explicit. Apply the irreducible/class count over C after proving the rational Specht modules absolutely irreducible and pairwise distinct. The partition/class comparison and descent back to Q remain necessary. The count is not applied over an arbitrary nonsplitting field. |
| L3: CT4 → SW6 | Retain, inferred. Complex character integrality and trace compatibility after Q-to-C extension supply integrality of the rational trace, hence its integer refinement. This is not a proof of absolute irreducibility. |
| L4: CT5 → SW6 | Retain, explicit. The target expressly requests `IsCharacterTableSpec`. Cast the integral partition matrix to C, transport labels and prove every specification clause; orthogonality alone is insufficient. |
| L5: CT0 → SW7 | Retain, inferred. The class-function carrier supplies the domain of the finite-variable, degree-bounded Frobenius map. Rational coefficients are required for all rational class functions; the integral virtual-character lattice is a separate restriction. |
| L6: SW2 → CG2 | Retain, explicit. Transport the fixed product `a_t * b_t` and normalized rational idempotent to C and through the tensor action. CG2 supplies the equivariant image and tableau comparison. Reversing left-action application order without a comparison would change the contract. |
| L7: SW5 → CG2 | Retain, explicit. The standard-polytabloid basis gives the Specht dimension `f^lambda`; scalar extension preserves it and CG2 uses it as the GL-factor multiplicity. This is not the dimension of that GL factor. |
| L8: SW7 → CG4 | Retain, explicit, with the packet's restricted scope. Tableau sums, finite Schur polynomials and Jacobi–Trudi supply the combinatorial character expression. The target's broader advertised bialternant/Pieri/Littlewood–Richardson package is not certified; O2 records its missing supplier contracts. |
| L9: SW8 → CG2 | Retain, explicit. The complex tensor decomposition and mutual image commutants supply CG2's decomposition after a factor-order and Young-image comparison. Retain the partition-length bound; full group-algebra faithfulness cannot be presumed in small dimension. Clarified the reason to distinguish the existing generic bicommutant theorem from the still-needed GL-span identification. |
| L10: SW2 → AG2.1a | Retain, inferred. The rational idempotent identity survives a proved Q-algebra map into the actual correspondence algebra. The consumer explicitly requests Schur projectors. Correspondence construction, graded signs, selected functor, field, Tate twist and degree remain geometric obligations. No late local-Langlands comparison is imported into raw cohomology. |

These are dependencies on planned outputs. Accepting them does not establish the underlying representation-theoretic theorems or repair their source roadmaps.

## Every overlap

| Overlap | Decision on the recommendation |
|---|---|
| O1: SW8, CG2, CG4 | Confirm `rescope`. Both describe Young-image modules and character identification. Retain one early image constructor under CG2's ownership, with a separate multiplicity-space comparison; a reverse whole-stage edge would hide circular construction. |
| O2: SW7, CG4, LieHighestWeight6 | Confirm `rescope`. The consumers advertise more symmetric-function outputs than SW7 actually pins. Require separate finite-variable bialternant/divisibility, Pieri and LR contracts. Lie-theoretic minuscule Pieri is narrower. |
| O3: SW7, CG6 | Confirm `rescope`. The interlacing-pattern/tableau dictionary is not RSK. CG6 should own that comparison, with bounds on diagram cells and a separate determinant-shift treatment for rational weights. |
| O4: SW9, CG0 | Confirm `rescope`. Both need a consistent bilinear-form group, GL inclusion and invariant pairing. The matrix-library warning is documentary, not a verified pinned API claim. The symplectic crossing-sign issue independently justifies withholding an action interface until conventions are repaired. |
| O5: SW8, SA3 | Confirm `rescope`, correct the proposal. The quoted simple-module stage is narrower, but the pinned library already supplies the semisimple image theorem. Reuse that declaration and update the owner contract; the independent GL-span identification still needs proof. No unsupported SA3 → SW8 edge is added. |
| O6: SW0, PolynomialGaloisGroups0 | Confirm `rescope`. Both keep fixed points in finite-permutation cycle data, but one uses a partition and the other a multiset. A natural adapter should preserve the established owners; neither full arithmetic nor Specht development is its prerequisite. |
| O7: SW6, CT6 | Confirm `keep`. Murnaghan–Nakayama and Dixon–Schneider are independent algorithms with a common specification and small-group comparisons. Shared tests do not impose an algorithm-to-algorithm dependency. |

For O5, I read the declaration and its surrounding parameters in [TauCeti/RingTheory/Semisimple/DoubleCentralizer.lean at the pinned commit](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/Semisimple/DoubleCentralizer.lean). `TauCeti.centralizer_centralizer_range` assumes a commutative ring K, a K-module N finite over K, a semisimple K-algebra S, and an algebra map `ρ : S →ₐ[K] Module.End K N`; its conclusion is that the double centralizer of `ρ.range` equals `ρ.range`. No injectivity of ρ is assumed. This is exactly the generic image theorem previously requested for construction. Applying it to the symmetric-group action still needs its representation and hypotheses, and does not identify the GL span by itself. The current reviewed `data/library-coverage.json` has no SchurWeyl or SemisimpleAlgebras owner entry; that absence was not treated as proof that the declaration was absent. This targeted source check is not a full library audit or a compilation claim.

The handoff's elementary sign diagnostic is sound: with cap `(0,1,-1,0)`, inverse cup `(0,-1,1,0)` and tensor flip P, the rank-one operator E has `E² = -2E` and `PE = EP = -E`, contradicting an unsigned `sE = E` relation. This diagnoses the stated convention, not all Brauer relations. Similarly, for the row shape (2), the column sum is 1, so reversing the two Young factors still gives the trivial image rather than the conjugate partition's sign image. Retaining the fixed algebra product in L6/L10 avoids relying on that erroneous prose.

## Independent completeness check

The search covered all ten own stages, exceeding the five-stage requirement, across full atlas stage text and roadmap text. Searches included Schur–Weyl variants, Specht/polytabloid, Young subgroup/symmetrizer/tableau/diagram, full cycle type, hook length, character-table specification, Murnaghan–Nakayama, Frobenius characteristic, Schur polynomial/functor, Jacobi–Trudi, Pieri/LR, RSK, Gelfand–Tsetlin, tensor commutants and Brauer/Temperley–Lieb diagrams. Relevant matches were compared by objects, hypotheses and claimed use; matching words alone were rejected.

| Own stage(s) | Search outcome |
|---|---|
| SW0 | PolynomialGaloisGroups is already O6. BelyiMaps explicitly uses that owner's `fullCycleType`; NumberFieldArithmetic and ModularForms use arithmetic factorization certificates. No new direct SW0 prerequisite is established. |
| SW1 | IR2 supplies exactly the existing induction comparison. General induction, Mackey theory and character restriction do not supply an additional stated Young-module theorem. |
| SW2–3 | Existing CG2 and AG2.1a links survive. AutomorphicBundles B4 mentions Schur-functor weights, but does not specify a rational tensor-projector construction with the coefficient/descent hypotheses needed to infer another SW2 link. No distinct consumer of the SW3 submodule theorem was established. |
| SW4–5 | CT2 and CG2 are already covered. Highest-weight classification and GL hook-content dimensions have different carriers and do not add Specht-classification or Specht-dimension edges. |
| SW6 | CT4–6 are already covered. BelyiMaps Layer 3 explicitly derives its arbitrary-finite-group count from CT1/3/4; its S3 check does not require the partition recursion. |
| SW7 | CG4/6 and LieHighestWeight6 are covered by L8/O2/O3. LieHighestWeight9 and SpinRepresentations9 use Lie-theoretic dual-standard Pieri, not a supplied general combinatorial LR theorem. Arithmetic Frobenius characteristic polynomials are a different construction. |
| SW8 | Existing CG2/CG4 and SA3 boundaries cover the exact matches. General reductive/Lie centralizers and simple-subalgebra centralizer dimension formulas do not supply the missing tensor GL-span theorem. |
| SW9 | CG0 remains O4. No canonical TemperleyLieb roadmap exists in this catalogue; a knot-theory mention does not supply nonplanar loop-stacking associativity. Brauer groups are not Brauer diagram algebras. |

The five new catalogue entries—AnalyticStacks, QWittVectors, AnalyticHabiroStack, RingStacksAndTransmutation and SolidAnalyticRings—were screened through purpose/scope, stage titles and full-text searches; QWittVectors QW.0–1 received additional reading. Lambda-ring Adams operations do not by themselves state a comparison to SW7, and solid idempotent algebras do not supply Young projectors. All five receive qualified `none` entries. The original 212 coverage entries remain, yielding exactly the current 217 other IDs without duplicates. This is a completed screen and an independent spot-check, not a claim that every possible future relationship has been excluded.

## Validation and remaining work

Executed on the edited deliverables:

```text
python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_RepresentationTheory_SchurWeyl.json
10 links; 7 overlaps; 217 examined; 0 errors; 0 warnings

python3 research/blueprint/intake.py check-files research/blueprint/links/tauceti_TauCetiRoadmap_RepresentationTheory_SchurWeyl.json research/blueprint/reviews/REV-LINK-tauceti_TauCetiRoadmap_RepresentationTheory_SchurWeyl.md
2 files; 0 problems
```

Additional assertions checked all 20 literal stage quotes, unique edges, the exact catalogue coverage set and preservation of every endpoint and evidence quote, with only L9/O5 contract text corrected. The link validator checks endpoints and cycles against atlas edges and the other current link packets. No Lean file was produced or compiled; the one positive baseline claim above was checked directly in the pinned source; other quoted library names remain documentary evidence. Upstream constructor ownership, symmetric-function targets, bilinear/sign conventions and proof obligations remain the explicit follow-up work recorded by the accepted overlaps and original handoff. Only the issue's packet and this report are changed.
