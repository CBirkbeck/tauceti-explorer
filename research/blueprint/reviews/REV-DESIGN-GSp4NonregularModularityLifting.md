# Independent review: minimal modularity lifting for GSp₄ in nonregular weight

**Verdict: accepted**, as a complete target-level planning pass with its proof gates recorded. Nothing here is claimed to be formalised.

Reviewer: Claude (session claude-lwH4V1), `independent-review-REV-DESIGN-GSp4NonregularModularityLifting`, 19 October 2026, issue #3535. The design is Codex's (session codex-8MPq4f, issue #3449, PR #10624). The reviewer did no part of the design.

## What was checked

- **Sources, at every locator.** CG20 was read in the author-hosted published text (SHA-256 `fff30587…`, page n = published page 800+n), with arXiv:1907.08691v1 used for readable text. The other sources were P20 (the maintainer-cleared author copy, `4c05724e…`), P12 (`dd382d42…`), M14 (`6db29e74…`), BCGP25 (`51d7eacc…`) and BCGP21 (`7c8d74b0…`). All checksums match the packet. PS16 did not download from the Stroh URL; a byte-identical copy (same SHA-256 `2c9f90c3…`) is at Pilloni's page (`koko.pdf`), and the packet and reader now record both.
- **Baseline.** All six declarations exist at Mathlib `082e2d3` and Tau Ceti `f790474` with the stated content: `ZMod`, `Module.End.genEigenspace`, `Module.End.mem_genEigenspace_nat`, `Matrix.symplecticGroup`, `IsIdempotentElem` and `TauCeti.ContCohomology.H1`. None was removed.
- **Suppliers.** Every cited stage description was read: ArithmeticGaloisRepresentations, AutomorphicBundles, AutomorphicGaloisRepresentationsPartII, AutomorphicLFunctionsAndLocalFactors, DeformationAndDerivedPatchingAlgebra, GlobalGaloisDeformations, HigherHidaAndColemanTheory, HodgeTateAndCanonicalSubgroups, IntegralHeckeAndGaloisDeterminants, LocalGaloisDeformationRings, ModularityAndLanglandsExtensions, PadicHodgeTheory, ShimuraCompactifications and SmoothRepresentationsOfLocalGroups. Two upstream READMEs were also read: IntegralHeckeAndGaloisDeterminants (§§1.5–1.7, 3a.2) and SmoothRepresentationsOfLocalGroups. Both are taken from the open upstream roadmap branches checked out locally; neither is yet on TauCetiRoadmap main.
- **Routing.** The reviewed extractions PAPER-CALEGARI-GERAGHTY-20, PAPER-PILLONI-20 and PAPER-BOXER-CALEGARI-GEE-PILLONI-25 were compared against the design's source issues and ownership.
- **Suggested file.** `lean-check` elaborates it with only admitted-proof warnings, both before and after the review's two added examples. `check_sorry_data.py` passes.
- **Checker.** `check_blueprint.py` reports 0 errors and 0 warnings on the corrected packet.

## Counts

- **Nodes:** 61 (60 inherited, 1 added): 9 definitions, 11 constructions, 39 theorems, 1 comparison and 1 application.
- **Verdicts:** 39 verified, 21 corrected, 1 added.
- **Other contents:** 62 API items, 60 unit tests, 52 planets (at most six per layer), 6 baseline declarations, 30 requests (2 added) and 13 gaps (one removed).
- **Source issues:** 26 (2 added), of which 25 are confirmed and 1 rejected.
- **Stages:** all twelve remain planned and none is closed.

## Corrections

**Matches.** Every node's `match` field was a verbatim copy of its `statement`, so nothing recorded what the source says at the locator. Each match now states, in our own words, what the cited place states and how it supports the node. Test kinds `value` and `boundary` were renamed to the protocol's `computation` and `degenerate`.

**Locators.**
- BCGP25's monodromy upgrade is Remark 1.8.20, not a proposition.
- Its dual-spin interpolation is Lemma 4.12.1, not a theorem.
- In NR10 the right labels are Lemma 7.3.8 (p.167) and Lemma 7.4.15 (p.173), and Proposition 7.4.16 is on p.174.
- PS16 gains Corollary 3.14 (p.19), the genus-two Galois-representation statement.
- CG20 gains Definition 6.1 (NR3) and Proposition 4.10 (NR0).
- The weight dictionary cites Lemma 4.12.1 and Definition 1.8.16.

**Statements.**
- *NR0 minimal tame level.* Δ_Q is ∏(Z/x)^×, the deck group of X₁(Q)→X₀(Q) (CG20 §5.2), not its p-part; patching uses quotients of p-power order.
- *NR3 Hasse range.* The threshold is t=rs(p−1)≥N(μ), not rs≥N(μ) (Lemma 6.4).
- *NR6 Taylor–Wiles comparison (high-comparison, hasse-descent, tw-comparison).* CG20 Theorem 7.3 gives d_Q⁻¹tr as the inverse of pr_Q∘i, and that is false. The inverse is v_Q⁻¹∘tr with v_Q=tr∘pr_Q∘i, a unit of the completed spherical Hecke algebra at Q. The reviewed CG20 extraction had confirmed this as its E72, but the design asserted the false inverse in three nodes. The review checked it again in the GL₂ analogue: (q+1)⁻¹tr(pr_α f)=(qα−β)f/((q+1)(α−β)), which is not f. It is recorded as new source issue E25.
- *NR6 projector.* The ideal m of Theorem 7.2 must contain ⟨u⟩−1 for u∈Δ_Q to be maximal (CG20 extraction E74; new source issue E26).
- *NR6 secondary Hasse invariant.* Its injectivity now rests on the nonordinary locus being a Cartier divisor in a smooth threefold, not on reducedness.
- *NR2 completed eigenspace (isotypic).* The "completed eigenspace exactness" gate is removed (E15 rejected). Nonvanishing of V[m_f] follows from finite length: m_f lies in the support of the quotient Gr⁰ of the finite-dimensional χ-isotypic part. No exactness of the eigenspace functor is used.
  - The isotypy step uses BCGP25 Propositions 4.11.1–4.11.2, which hold when only the Frobenius characteristic polynomials annihilate the representation. These are now requested from ArithmeticGaloisRepresentations R01.5, where the reviewed BCGP25 extraction routes them.
  - The Cayley–Hamilton recognition of IntegralHeckeAndGaloisDeterminants Layer 1.6, previously cited, needs annihilation by the whole Cayley–Hamilton ideal.
- *NR2 monodromy.* The adjoint input of the upgrade is local: holomorphy at s=1 of the adjoint L-factor of a generic L-packet (Gan–Takeda, part vii), used with Taylor–Yoshida Lemma 1.4. It moves to the local paramodular and Klingen gate, and the former "Analytic classification and adjoint input" gate is renamed "Classification input".
- *NR10 dyadic descent.* BCGP25 Lemma 7.4.8 (p.170) is itself a GSp₄ coefficient-descent lemma valid at p=2: Gee–Geraghty's Lemma 7.1.1 adapted so that no division by 2 occurs. The design had made this a supplier gap. It is now the added node NR10/dyadic-descent, whose sketch fills the one implicit step: Carayol's lemma gives the alternating form over S rather than over R. NR10/deformation-action follows Proposition 7.4.10.
  - The former dyadic gate is narrowed to what is really missing: GSp₄ pseudocharacter reconstruction over Q̄p for NR2/weight-two (BCGP25 Theorem 1.8.17). Upstream IntegralHeckeAndGaloisDeterminants reconstructs only for GL (Layer 1.7).
- *NR11 solvable descent.* BCGP25 Proposition 7.5.3 is requested from EndoscopicTransferAndUnitaryTraceComparison ET.7, its owner in the reviewed routing. It is no longer folded into the gate for the unregistered OrdinaryAutomorphicFormsAndModularityLiftingPartII, which keeps Theorems 5.7.14 and 6.3.4.
- *NR3 regular-weight representation (closure).* The regular-weight Siegel representations of CG20 Proposition 6.8 are now imported from AG2.5, AG2.6 and ML.4, with those requests extended.

**Gates kept.** The roadmap definition's `requires` lists and three stage descriptions were synchronized. The reader was regenerated from the corrected packet with the design's own layout, and it reproduces every unchanged block byte for byte. The suggested file gained the `signed_unit` and `ordered_pair` examples that the packet listed.

The following design judgements were checked and kept:
- the selected-summand balance gate (E5, with its O[C_p] counterexample);
- the all-index contraction obligation;
- the Pilloni flag-orientation discrepancy;
- the Pilloni–Stroh lattice caveat;
- the corrected characteristic-zero patching gate.

## Source issues

Confirmed, with the review's reason recorded in each entry: E1–E14, E16–E26.

- **Changed fields.** E6, E14, E21 and E22 now have `affects: nothing`, since each is a misprint whose intended meaning is clear. E2 becomes a `gap`. E7 is rewritten: the "smooth, hence irreducible" remark is in Lemma 7.4 and concerns X and X₀(Q); the unsupported step in Lemma 7.5 is injectivity of the secondary Hasse invariant.
- **E16** (the dyadic neat-prime congruence) is confirmed as a misprint. The BCGP25 extraction's review had rejected the same point (its E031) on the ground that the condition is redundant at p=2. That reasoning is mistaken: "r≢1 mod 2" holds for no odd prime.
- **E15 is rejected.** See the NR2 completed-eigenspace correction above; the BCGP25 extraction never flagged that lemma, so the design's "already flagged" note was wrong.
- **E25 and E26 are added** from the CG20 extraction, as described under NR6.
- A small slip noticed but not recorded: BCGP25's proof of Lemma 4.12.3 cites "Corollary 4.11.2", but the result is labelled Proposition 4.11.2 (p.110).

## Questions for the orchestrator

1. **The IntegralHeckeAndGaloisDeterminants upstream note.** BCGP25 Lemma 7.4.8 shows the symplectic coefficient descent of Layer 1.5 holds for p=2 when the multiplier is S-valued, and Layer 1.7 lacks GSp₄ pseudocharacter reconstruction. Pass both points upstream.
2. **The BCGP25 extraction's E031** (rejected) contradicts this packet's E16 (confirmed). The register should follow the later verdict.
3. **Ownership of regular-weight GSp₄ Galois representations.** BCGP25 Theorem 1.8.13 is routed to the proposed GSp4LocalLanglandsAndGaloisRepresentations, while CG20 Proposition 6.8 is requested here from AutomorphicGaloisRepresentationsPartII AG2.5–AG2.6. One owner should be chosen when that proposal is designed.
4. **Proposed suppliers without stable stages.** IntegralCoherentHeckeComplexes, SiegelModularFormsModPn, GSp4LocalLanglandsAndGaloisRepresentations, OrdinaryAutomorphicFormsAndModularityLiftingPartII and OpenImageTheoremsForAbelianVarieties still have none. Their contracts are in the gates and need stage ids before packaging.
