# PAPER-TEMKIN-17: Tame distillation and desingularization by p-alterations

Michael Temkin, *Tame distillation and desingularization by p-alterations*, Ann. of Math. 186 (2017), 97–126 ([published article](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n1-p03-p.pdf), [arXiv:1508.06255v2](https://arxiv.org/abs/1508.06255v2)).

Original extraction: Claude Code, `cc-39fac3`, 29 September 2026, issue #1155. Verified corrections: Codex, `codex-rtOQ9t`, 30 September 2026, issue #4988. Status: **complete extraction**; blueprint proof closure and Lean implementation are not claimed. [The fix report](../redteam/RT-PAPER-TEMKIN-17.fixes.md) accounts for all 17 confirmed findings, including the verifier's scope corrections.

The [machine-readable extraction](PAPER-TEMKIN-17.result.json) has **79 items: 8 library, 3 planned and 68 missing**. Every missing item is routed exactly once. There are four routes, thirteen prerequisite entries and ten source findings. All 64 original item IDs remain; the three original route positions remain, and the SF.4 source route is appended as route 4.

## Source and verification

The original extraction read all 30 pages of the published article (SHA-256 `1f4ac06f2f31430abdd984d8e635a324defb6de340f6a599f708c04996fbfba4`) and compared the 24-page arXiv v2 (SHA-256 `24f67ac306b7af4bf058c086a76f29bbd8854639354bcb241275d8e2dd43a435`). Both were freshly retrieved for this fix. The fix reread published pp. 104, 113, 115, 117–119 and 121–124, checked images of pp. 117 and 123, and compared the affected v2 passages. It also read the relevant Exposé X definition/proof and Temkin's stable-modification statements. This targeted reread does not replace the earlier complete-reading provenance.

The reviewed audit, accepted RS-25, current layer descriptions and declarations at Mathlib `082e2d3` and Tau Ceti `f790474` were checked. Detailed URLs, hashes, declaration paths, assumptions and dependency checks are in the fix report.

## What the paper proves

Theorem 1.2.5 claims that a scheme X of finite type over a quasi-excellent scheme of dimension at most three, with nowhere dense closed Z, has a projective char(X)-alteration b : X′ → X with regular source and b⁻¹(Z) the support of an snc divisor. Over a perfect field it can be separable. Theorem 1.2.9 gives the corresponding log-smooth alteration of a morphism. Theorem 4.3.1 gives the universal P-resolvability and morphism forms under char(S) ⊆ P.

The method runs through arbitrary-rank valued-field tameness (Theorem 2.6.6), constructible compactness and openness of tame loci on Riemann–Zariski spaces, field and alteration tame distillation (Theorems 3.2.12 and 3.3.6), then Gabber's log-geometric modification argument. Pank splitting, Krasner/decompletion and composed valuations supply the valued-field part.

Two proof gaps must remain visible. For projectivity, the universal-resolvability definition must use projective alterations, following Exposé X. The construction must also establish snc of b⁻¹(Z) itself: an snc union with a vertical boundary does not imply it. For the separable case, the distillation step needs separate variants for separable input. These are recorded as E5 and E6 and explicit blueprint obligations, not silently attributed to the printed proof.

## What the libraries and atlas supply

The original four library items cover valuations, the primitive element theorem, the valuative criterion of properness and étale local structure. Four additional library items now cover valuation rings dominating local subrings; openness of flat locally finitely presented morphisms; Chevalley constructibility for quasi-compact locally finitely presented morphisms to qcqs targets; and constructible compactness of qcqs schemes.

Tau Ceti already supplies `ValuationSpectrum`, continuous pullback, spectrality and compact patch topology. Mathlib supplies valuation-ring prime localizations and their correspondence with overrings, and linear disjointness of separable and purely inseparable subextensions. These support `absolute-rz`, `composed-valuations` and `split-towers`, but their full statements remain **missing**: respectively the field/valuation-ring identification and centre/openness adapters, residue-valuation composition and chains, and existence of separable distillations.

Three items are planned: the existing de Jong alteration scope at L5, Kato's log-smooth chart criterion at CR.5:log-algebra, and regular schemes at ModularCurves 4D. The last imports Mathlib's `IsRegularLocalRing` and `IsRegularRing`. General qcqs flattening, universally Japanese normalization and the non-proper relative-curve stable-modification input are missing in the required scope; L5's narrower tasks do not supply them.

## Routes and shared owners

| Route | Owner | Items | Scope |
|---|---|---:|---|
| 1 | PrimeToDegreeAlterations, Part II of AdicCoefficientsAndComparisons | 30 | Degree-controlled alterations; pointed-scheme RZ extension; tame loci/distillation and its separable variants; non-proper stable modification and boundary log smoothness; non-free quotient gluing; Gabber modification and the repaired main proof routes. |
| 2 | LocalFieldsPartIIGeneralValuedFields, Part II of LocalFieldsRamification | 28 | General valued-field tower/comparisons, Pank, decompletion, composed valuations, general Abhyankar input and tameness, including separably P-closed implies separably P-tame. |
| 3 | CrystallineCohomology:CR.5:log-algebra | 5 | Divisorial log structure, log regularity, the regular-noetherian extension of the existing snc boundary carrier, log Abhyankar, and log smooth over log regular. |
| 4 | SchemeAndStackFoundations:SF.4 | 5 | General flattening, universally Japanese normalization, named embedded resolution, quasi-excellent schemes and universally Japanese/Nagata schemes. |

Route 1 keeps the existing PrimeToDegreeAlterations id and coalesces with PAPER-DITTMANN-POP-23 and PAPER-JANNSEN-16. It imports SF.4's general scheme inputs rather than planning them again. SF.4 coalesces Stacks 081R with PAPER-BHATT-18's accepted route 6 and the MotivesAndAlgebraicCycles request; Cossart–Piltant/Lipman are named proved resolution settings under RS-25. The Lipman input builds compatibly on StableReduction Layer 4's DVR-curve case.

For relative curves, L5's `de-jong-5-8-curve-fibration-alteration` is the projective integral-excellent base case. The extension to non-proper curves uses Temkin 2010 Theorems 1.1 and 1.5 and Corollary 1.6, as Exposé X Remark 3.4.1(i) requires. The semistable log-smoothness item retains the boundary containing the non-smooth fibres.

Route 2 imports the strictly henselian arbitrary-rank pro-p/tame-quotient theorem from ClassicalAdicEtaleCohomology:H1:valuation-nearby-cycles and obtains §2.2.6 over k^u. LocalFieldsRamification Layers 2–4 supply the local-field special cases; ProfiniteProPGroups Layer 2 supplies Sylow theory. ModularCurves 4D supplies strict henselisation of local rings. Additional semilocal non-strict henselisation and filtered-colimit compatibility are explicit supplier requests, consolidated with draft PerfectoidSpaces:P3 and H1/SF.2 work; they are not asserted to be in 4D's strict-only text. The Part II constructs the valuation-ring comparisons, not another local-ring henselisation functor.

The general Abhyankar inequality is owned by the valued-fields Part II and exported to DiamondEtaleCohomology:C8. C8 retains its stronger comparison with modified topological transcendence degree, which is not closed by the algebraic inequality alone.

For RZ spaces, ClassicalAdicEtaleCohomology:H1:henselian supplies the affine dominant-point Huber limit theorem, also used by DiamondEtaleCohomology:C5. Route 1 must identify its construction with this on the same Spv carrier. The dependency is **H1:henselian → PrimeToDegreeAlterations**; the reverse direction would conflict with the existing H1 → L5 path. All ten proposed supplier edges checked in the fix report are acyclic at the checked snapshot.

The snc item extends AlgebraicModuliForArithmeticGeometry:R09.7a's existing boundary interface through CR.5, using the Exposé X support convention. Quotient gluing imports ModularCurves 0C's affine invariant-ring quotient, retaining its finite-type condition before asserting finiteness; non-free actions are allowed and are not automatically torsors.

## Cited inputs and remaining blueprint obligations

The prerequisites retain Illusie–Temkin Exposés VIII and X, de Jong, Pank/Kuhlmann–Pank–Roquette and Ershov, Temkin 2010, Lipman, Kato, Raynaud–Gruson and Brink. Cossart–Piltant is now cited as *J. Algebra* 529 (2019), 268–535, doi:10.1016/j.jalgebra.2019.02.017, with arXiv:1412.0868v2. The required input is embedded universal resolution; SF.4 must identify its exact source theorem and establish projectivity before supplying E5. Updating publication metadata is not a claim to have read that full article. SGA 1 Exposés V §1 and XIII §5 are added for quotient and tame/log inputs.

The three new separable items state their hypotheses explicitly. Separably P-closed fields yield tameness for **separable** extensions at residue characteristics in P, through perfection. The field-distillation variant assumes L/K finite separable; the scheme variant assumes Y → X generically separable. Neither upgrades a general inseparable extension to a separable one.

The five new scheme/boundary/quotient items include API outlines and semantic tests for their future blueprints. No recursive proof closure is imposed on this extraction.

## Source issues

| ID | Kind | Locator in the published article | Correction or required argument |
|---|---|---|---|
| E1 | gap | Theorem 4.2.1 and Step 4, pp. 121–122 | Use char(S) ⊆ P, the needed scope and Exposé X's base hypothesis; the more general printed version needs the recorded descent argument. The older review's explanation of Exposé X's hypothesis is corrected. |
| E2 | misprint | Lemma 3.3.7, p. 120 | Correct the implication direction, S/S′ and L/L′ in the Galois-closure argument. |
| E3 | misprint | Theorem 2.6.6, p. 112 | Corollary 2.5.6 has no part (ii). |
| E4 | misprint | Lemma 2.6.3(ii), p. 112 | Use the residual characteristic exponent of the induced valued field, not the characteristic of its underlying field. |
| E5 | gap | §4.1.4 and §4.3.2, pp. 121, 124 | Restore the projective convention and prove the exact inverse-image snc property from the construction; an snc enlargement is insufficient. |
| E6 | gap | Theorem 4.2.1 Step 4, p. 122 | Supply separable field/alteration distillation variants; arbitrary maximal P-extensions do not guarantee separability. |
| E7 | gap | Lemma 3.2.10, p. 117 | Replace the chosen étale polynomial by the minimal polynomial before asserting injectivity. The lemma survives. |
| E8 | error | §3.1.7, p. 115 | Separatedness implies injectivity for a pointed scheme; the converse fails for a non-dominant point. |
| E9 | misprint | Lemma 3.2.10, p. 117 | The internal reference is to the first part of the lemma. |
| E10 | misprint | Theorem 4.2.1 Step 10, p. 123 | Define T̄; the composite is log smooth and its source log regular; correct the target to (S,W). |

E5–E6 affect proof arguments; E7–E10 leave the downstream conclusions unchanged after their stated repairs. The record includes the snc-enlargement, standard-étale-polynomial and doubled-origin counterexamples. E1–E4's original records and independent-review dispositions remain, except for the explicitly verified correction to E1's explanation. No new independent source-issue verdict is fabricated.

The Annals page, Crossref record, arXiv history, author publication page and an erratum search were checked on 30 September 2026; no correction was found. This is not an exhaustive novelty claim.

## Review and validation

The original independent review (Claude Code, `cc-fb70e5`, 29 September 2026) accepted the three original routes and confirmed E1–E4. Its derivation of projectivity from 4.3.1(ii) and its no-existing-owner assertions are superseded by the verified corrections above. The historical paper-review file is outside this issue's scope and remains unchanged. The appended SF.4 route needs an explicit accepted route-4 disposition when the corrected extraction is independently reviewed.

The paper validator, intake on the three deliverables, preservation/routing guards, exact source-version check and dependency-cycle checks pass. No Lean file is requested or changed; no compilation was run.
