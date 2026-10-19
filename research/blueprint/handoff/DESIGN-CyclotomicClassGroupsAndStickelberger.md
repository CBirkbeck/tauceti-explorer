# Handoff: DESIGN-CyclotomicClassGroupsAndStickelberger

Issue: #11183. Worker: Codex (GPT-6), session `codex-8OEJ4S`. This is the original design pass, not an independent review.

## Completed pass

The new automorphic roadmap, whole-roadmap packet, full reader and compact suggested file cover all nine layers C0–C8. The packet is `complete` in PROTOCOL §0’s target-level sense. Every layer is `planned`; none is `closed`. All 47 nodes retain `implementationStatus: unchecked`. No implementation or source-closure claim is made.

Counts: 8 definitions, 3 constructions, 26 theorems, 8 comparisons and 2 applications; 44 API items; 44 discriminating tests; 27 planets, at most six in any layer; 17 actual pinned baseline declarations; 12 supplier requests; three explicit gaps.

The reader contains every node’s full statement, hypotheses, construction/proof, exact inputs, source locators, acceptance checks and all APIs/tests. Generality includes every prime and prime-power level, the dyadic boundary, and full Stickelberger annihilation at every conductor. Mazur’s conductor-p vanishing is propagated to all levels using exact control and compact Nakayama; the p=691 exception is retained. Universal Vandiver is only a conjecture.

The suggested file has 118 lines: four light definitions with bodies, seven admitted milestone theorems and four proved coefficient examples. It imports Mathlib and the Tau Ceti class-group equivalence module actually used by the all-conductor annihilation statement. The difficult constructions and their APIs are mathematical targets in the reader, rather than replacement carriers or admitted data in Lean.

## Checks

- `lean-check research/blueprint/suggested/CyclotomicClassGroupsAndStickelberger.lean`: exit 0 at the supplied pinned build, with exactly seven warnings, all declaration-uses-`sorry` warnings. The four coefficient examples are proved. Available memory exceeded the required 20 GB before compilation. No language server or Lake build/update/cache operation was started.
- `python3 scripts/check_blueprint.py research/blueprint/packets/CyclotomicClassGroupsAndStickelberger.json`: also run with the supplied baseline declaration index; zero errors and zero warnings.
- `python3 research/blueprint/intake.py check-files` on precisely the five deliverables: zero problems.
- Consistency checks: acyclic internal node and layer graphs; every packet statement and API/test present in the reader; all four definition names and seven milestone names present in Lean; every definition/construction has uses, at least three API items and at least three discriminating tests; at most six planets per layer; no admitted definition or example; no private absolute paths. All passed.
- `git diff --cached --check`: passed; only this issue’s four deliverables and this handoff are staged.

Pins: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Each baseline statement was read. The reviewed library audit has no entry for this new roadmap. Searches also covered the supplied current read-only Tau Ceti library and current TauCetiRoadmap main, including the newer roadmaps missing from the atlas snapshot. Existing analytic class-number residue, Hilbert 90, unit-ratio and class-group functoriality results are imported.

## Layer status and precise remaining work

- **C0: planned.** Obtain the requested native Artin, transfer and cyclotomic comparison interfaces.
- **C1: planned.** Obtain the arithmetic unit Herbrand-quotient and genus-sequence contracts from ClassFieldTheory; compare the saturated version of Hilbert 91 to his original unit convention.
- **C2: planned.** Obtain the requested prime-representative and local valuation interfaces; independently confirm source issues E2–E3.
- **C3: planned.** Obtain the explicit primitive L-value, conductor-discriminant and global Kummer interfaces; reconcile all normalization comparisons.
- **C4: planned.** Close G1 and the precise good-reduction supplier extension; verify the imported representation and finite-flat contracts together.
- **C5: planned.** Obtain the local Kummer/ramification and finite class-field contracts used by primary units and one-prime propagation.
- **C6: planned.** Apply the finite-unit ownership moves; close G2 for the dyadic index theorem.
- **C7: planned.** Resolve G3 before upstream packaging; import, do not redevelop, the general Iwasawa module and growth theorem.
- **C8: planned.** Obtain the constant étale-torsor/class-field comparison and repoint the Eisenstein-ideal consumer to the precise inverse-character target.

## Explicit gaps

- **G1.** Ribet Theorem 3.3, pp.157–158, explicitly uses the relative class-number bound. Its cited Carlitz–Olson Maillet determinant identity has not been read in full: the AMS PDF returned HTTP 403. Read Proc. AMS 6 (1955), pp.265–269, DOI 10.1090/S0002-9939-1955-0069207-2 (JSTOR 2032352), or an authorized public proof, verify the exact determinant normalization, and connect Hadamard to the stated bound. The bound is a target, not a verified baseline fact.
- **G2.** Sharifi Theorem 4.3.3 is stated for odd p. The target here includes p=2 at every level, with explicit odd-a real generators and torsion conventions. A formaliser must verify the dyadic determinant/regulator adaptation with its exact factor of 2, or read a public proof of that full statement. Its reduction has been specified; the odd-prime citation is not presented as a dyadic source theorem. Washington and Lang were not in the cleared library index and no uncleared copy was used.
- **G3.** The finite cyclotomic-unit results move below IntegralIwasawaTheory, while C7 is a specialization of that roadmap’s existing general inverse-module and growth results. Apply the two-roadmap bundle proposal in restructure before packaging the whole roadmap, or place C7 and C8’s higher-level propagation with the Iwasawa consumer while preserving every target. No upstream insertion immediately after ClassFieldTheory can silently cite a higher package. This is an integration gap, not a missing mathematical theorem.

Resume from these gaps and requests, not by expanding minor lemmas: the target-level pass is finished. The independent reviewer should check the all-conductor Gauss-sum orientation, saturated relative-unit convention, exact-control propagation, and the source corrections. Closure requires the missing source reductions and exact supplier contracts, not just a green syntax check.

## Supplier requests

These are recorded in the packet and reader. Existing main-roadmap results are imports; missing contracts in their direction are Part II additions. No supplier file was edited.

- **`DirichletPadicLFunctions:L0`**: Primitive complex Dirichlet L-values: L(χ,0)=−B_(1,χ), the odd and even L(χ,1) formulas in Sharifi Theorem 4.2.14 (pp.104–105), including the finite logarithmic sum and Gauss-sum factor, and primitive-character Euler products. Use the existing generalized Bernoulli owner; request the exact finite-logarithm interface if absent. No p-adic L-function is constructed in this roadmap.
- **`ModularCurvesPartII:R13.6`**: Extend the modular-curve contract: the quotient J₁(p)/J₀(p), and the A_f occurring for nontrivial nebentypus, acquire good reduction over the completion of Q(ζ_p)^+ at p, as used in Ribet Proposition 4.4, pp.161–162. Boundary geometry in R13.6 alone does not prove this; record as a ModularCurves Part II addition coordinated with the abelian-variety owner.
- **`tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`**: For a conjugacy class in a finite Galois extension of Q, infinitely many unramified rational primes have that class. Apply in the normal Hilbert class field to represent a specified ideal class by a prime split over Q.
- **`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`**: Global Artin reciprocity and its equivariance under field automorphisms, using arithmetic Frobenius and ordinary Hilbert class fields.
- **`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`**: Hilbert p-class fields and finite norm/extension maps on native ideal classes, with Nj=[L:K], jN=ΣG and the cyclic genus sequence. Also request the arithmetic unit Herbrand quotient q(E_L)=1/[L:K] when infinite places do not ramify, and the global Kummer/unramified radical pairing and constant étale torsor comparison needed below. The latter explicit interfaces extend the main roadmap and are ClassFieldTheory, Part II contracts.
- **`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`**: Use only the local Kummer comparison and local ramification/discriminant consequences. The global radical and unramified pairing required by reflection is requested from layer 13, not inferred from this local layer.
- **`tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`**: Cyclotomic arithmetic dictionary: native conductor fields, compatible roots, tame/wild Galois splitting, unique totally ramified conductor prime, real subfield and norm relations. Request the conductor-discriminant product for CM abelian subfields as GlobalNumberFields, Part II; this stage does not already state an analytic class-number theorem.
- **`tauceti:TauCetiRoadmap/ModularForms#layer-0-diamond-operators-and-modular-forms-with-character-nebentypus`**: Native modular forms with nebentypus and integral weight-one/weight-two Eisenstein q-expansions, including all cusp constants. The precise integral constant-term contracts used in Ribet §3 are ModularForms, Part II additions where not stated on main.
- **`tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra`**: Commuting arithmetic-normalized T_ℓ and diamond actions, preserving the lattices and semi-cusp conditions used by Ribet.
- **`tauceti:TauCetiRoadmap/ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`**: Eigen-newform decomposition at prime level and the exclusion of oldforms for the nontrivial nebentypus ω^(k−2).
- **`tauceti:TauCetiRoadmap/ModularForms#layer-8-modular-symbols-the-integral-hecke-algebra-and-coefficient-fields`**: Integral q-expansion lattices over the coefficient ring, finite Hecke algebra, and Deligne–Serre eigenlifting of an integral residual eigensystem. Preserve all cusp constants and the chosen prime above p.
- **`tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-6-global-ramification-consequences`**: Different detects finite ramification, its tower/local-global dictionary, prime-power cyclotomic ramification, and the valuations used in Gauss-sum and primary-radical calculations.

## Ownership and package order

The finite core is below IntegralIwasawaTheory; finite circular units and their finite index comparisons move down rather than acquiring a second permanent owner. Apply these exact moves to the consumer in the coordinated restructuring:

- `IntegralIwasawaTheory:L0/cyclotomic-unit-group` → `CyclotomicClassGroupsAndStickelberger:C6/cyclotomic-units`: The finite prime-power circular-number/intersection definition only; inverse-limit units and Euler systems remain with their owners.
- `IntegralIwasawaTheory:L0/smoothed-cyclotomic-unit` → `CyclotomicClassGroupsAndStickelberger:C6/unit-generators`: The finite real ratio/root correction.
- `IntegralIwasawaTheory:L0/cyclotomic-unit-generators` → `CyclotomicClassGroupsAndStickelberger:C6/unit-generators`: All prime-power finite generator relations.
- `IntegralIwasawaTheory:L0/unit-index-real-full` → `CyclotomicClassGroupsAndStickelberger:C6/unit-generators`: The finite full-to-real unit quotient.
- `IntegralIwasawaTheory:L0/index-formula` → `CyclotomicClassGroupsAndStickelberger:C6/unit-index`: The odd prime-power finite index theorem.
- `IntegralIwasawaTheory:L0/dyadic-prime-power-index` → `CyclotomicClassGroupsAndStickelberger:C6/unit-index`: The dyadic finite index theorem, with G2 retained.

Generic inverse modules, Λ-structures, arbitrary Z_p-extension growth, norm-compatible systems and Euler systems keep their existing owners. C7 and C8’s higher-level consequence depend on the Iwasawa supplier. The packet proposes a two-roadmap bundle; the alternative is to place these application targets with IntegralIwasawaTheory. G3 must be resolved before packaging; the placement record does not assert an immediately-after-ClassFieldTheory total package order. Repoint EisensteinIdealAndRationalTorsion:EI.7/cyclotomic-obstruction to C8’s conditional unramified inverse-character quotient. Consumers must still prove their division fields abelian and everywhere unramified with the specified conjugation character.

## Sources and findings

Only public sources were used; all mathematical prose is paraphrased. No verbatim source passage or section-by-section source summary is committed. The packet records URLs, versions, read dates, locators and available hashes; the reader repeats the source register.

- **Sharifi**: Iwasawa Theory, Author notes, 189-page PDF served on 19 October 2026. Read: §1.3, pp.14–24; §2.8, pp.69–74; §3.1–3.2, pp.75–83; §4.1, pp.97–100; §4.2, pp.101–108; §4.3–4.5, pp.108–117; §4.7, pp.120–124 (local and global Bernoulli congruences).
- **Hilbert1897**: Die Theorie der algebraischen Zahlkörper (Zahlbericht), Jahresbericht DMV 4 (1897), public-domain ETH scan and its OCR. Read: §§54–58, Sätze 90–94, pp.271–279; §126, Satz 148, pp.393–397; §§139–141, Satz 156, pp.437–440.
- **MilneCFT**: Class Field Theory, Version 4.03, 6 August 2020. Read: VII §2, pp.205–207; VII §3, Proposition 3.1 and Lemmas 3.2–3.5, pp.208–209.
- **Ribet1976**: A modular construction of unramified p-extensions of Q(μ_p), Inventiones Mathematicae 34 (1976), pp.151–162; author-hosted journal scan. Read: Entire paper, pp.151–162; especially Theorems 1.1–1.3, §3 and §4.
- **Mazur1977**: Modular curves and the Eisenstein ideal, Publications Mathématiques IHÉS 47 (1977), pp.33–186, Numdam journal scan. Read: I §2, pp.50–54; Proposition 2.8 and Corollaries 2.9–2.10 checked visually on pp.53–54.
- **ConradKummer**: Kummer’s lemma, Author note, eight-page PDF served on 19 October 2026. Read: Entire note, pp.1–8; Theorem 1 and the proof on pp.6–7.
- **Soule1998**: Perfect forms and the Vandiver conjecture, arXiv:math/9812171v1, 22 December 1998. Read: Introduction, p.1, statement of Vandiver and the even eigenspaces only.

Washington and Lang were not present in the maintainer’s cleared library index; no uncleared copy was used. Carlitz–Olson’s full determinant paper remains unread because the AMS PDF returned HTTP 403; the DOI and precise pages are in G1. A full public proof of the dyadic unit-index normalization is still required by G2.

Four source findings, in own words with corrections and reasons, are recorded under `sourceIssues`: Sharifi’s prime-power cyclotomic polynomial evaluation/factorization, finite-field Gauss product, and primitive-root wording; Conrad’s final logarithmic sum endpoint. No published correction was found in the versions checked, so the packet requests independent confirmation. No separate errata job was claimed.

Two upstream notes preserve the audit limits: current ModularForms supplies analytic modular-symbol theory rather than the needed arithmetic realization; PadicMeasuresIwasawaAlgebras is reported merged by the order inventory but absent from the supplied main checkout, so its exact atlas nodes are cited as planned suppliers, not as pinned Lean declarations.

No suspicious instruction was observed in the untrusted source material. No other author’s text was followed as an instruction.

## Submission boundary

This run claims only #11183 and opens one PR with `Refs #11183`. The next action after intake is an independent review, then follow-ups for the open layers, supplier extensions and ownership/order reconciliation. The worker must not claim another job in this run. Source downloads, extracted text, generators and local logs are scratch only and are removed after submission.
