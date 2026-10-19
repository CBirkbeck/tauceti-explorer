# DESIGN-AutomorphicBundlesPartII

Issue: #3423. Agent: Codex. Session: `codex-x5O03Z`.

The planning pass is complete and ready for independent review. The roadmap merges all six routed continuations into one eight-layer Part II of AutomorphicBundles. The coefficient, perfect-complex and correspondence constructions feed the analytic comparisons, singular-weight calculations and boundary-localized cuspidal statements; there is no independent continuation split off from this job.

The five deliverables are the roadmap definition, blueprint packet, full reader, compact suggested Lean file and this handoff. All 99 input items are accounted for in `paperCoverage`: CG18 10, CG20 38, P20 21, BP26 20, BCGP21 9 and Sch15 1.

## Counts and coverage

There are 70 targets: 11 definitions, 11 constructions, 7 comparisons and 41 theorems. The 22 definitions/constructions have 66 API items and 66 definition checks. There are 41 planets, six pinned baseline declarations, 33 supplier requests, six named gaps, three restructuring proposals and 17 source findings, including two published errata records. All target implementation statuses are `unchecked`.

| Layer | Nodes | Planets | Status | Main outstanding verification |
| --- | ---: | ---: | --- | --- |
| IC.1 Integral coefficients and coherent duality | 6 | 5 | planned | Integral LP3 coefficient realization, supplied logarithmic model and coefficient-linear/derived cohomology comparison. |
| IC.2 Equivariant coherent perfect complexes | 5 | 4 | planned | General nilpotent freeness lifting, infinite affine rank and precise derived descent interfaces. |
| IC.3 Cohomological correspondences and filtrations | 13 | 6 | planned | Solid/discrete six operations, stable filtered coherence and formal completion compatibility. |
| IC.4 Hecke lifts, normalization and localization | 8 | 5 | planned | Exact geometric normalization, proper GAGA/tower trace compatibility and normalized Satake boundary restriction. |
| IC.5 Integral vanishing and Hecke relations | 13 | 6 | planned | Logarithmic coefficient BGG inputs, actual bad-level formal criterion, Hilbert–Siegel EO geometry and boundary regularity. |
| IC.6 Coherent cohomology and automorphic forms | 9 | 5 | planned | Growth and Fin_J interfaces; primary Harris cusp/subcanonical comparison and full compact-group components. |
| IC.7 Siegel chambers and singular weights | 7 | 5 | planned | Exact conditional global classification, local packet and multiplicity formula; full-group local coherent comparison. |
| IC.8 Boundary localization and cuspidal decomposition | 9 | 5 | planned | Boundary coefficient/Satake normalization, missing Hilbert–Siegel geometry, primary Φ verification and conditional packet hypotheses. |

No layer is closed. Each coverage record lists its precise supplier requests and direct gaps; transitive dependencies remain visible in the target graph. The full pass meets PROTOCOL section 0’s planned-stage stopping criterion; this is not an interrupted checkpoint. Follow-ups must settle the recorded interfaces and gaps before changing coverage to closed.

## Ownership and important distinctions

The parent B0–B5, SF.2, P7, A0-extension, AF.4 and other precise supplier nodes were read. They are imports, not reconstructed here. Current upstream AlgebraicVectorBundles already owns the generic scheme-module tensor/dual/finite-locally-free theory. Current IntegralHeckeAndGaloisDeterminants §3a–3b already owns the GSp4 spin polynomial, non-Eisenstein predicate and residual twist/dual transport. This roadmap owns only their geometric normalization comparison. Current Tau Ceti’s rational Young-symmetrizer module does not supply the integral dual-Weyl lattice; LP3 already plans that integral representation theory.

The reader records the current upstream and current Tau Ceti commits checked, independently of the pinned declarations used for elaboration. The late-added upstream roadmaps were screened for applicable existing ownership. No edits were made to either read-only environment or any supplier roadmap.

The core distinctions to preserve during review are:

- O-linear Matlis duality into E/O, finite-coefficient Serre duality and the trace counit; the entire shifted dualizing cohomology complex is not identified with the coefficient ring.
- Infinite free affine Čech terms versus a finite perfect replacement, contragredient deck actions and the dual coefficient in the chain model.
- Individual derived Hecke maps versus an algebra action, and homotopy classes of chain lifts versus a strict chosen chain action. IC.4 localization assumes an algebra action; its geometric integral application waits for IC.5’s relations. IC.5 itself needs only the individual operators and normalization, so this is not a cycle.
- Upper shriek versus lower shriek, proper first legs for the unrestricted global formula, and Tor-independent discrete coherent base change. BP26 itself explicitly imposes Tor-independence in §2.6.12; an older extraction’s suggestion that it uses unrestricted finite base change was not carried forward as an error in the paper.
- BCGP21’s acyclic EO Cousin computation for subcanonical coefficients, with canonical action obtained by actual integral duality. The formal completion step retains derived reductions and inverse limits.
- Su’s canonical-extension automorphic comparison versus the separate Harris cusp/subcanonical map; images and spectral multiplicities are retained.
- All-degree boundary vanishing over Q versus degree-zero boundary vanishing over general totally real fields. The latter gives an H0 isomorphism and H1 injection into canonical cohomology, not H1 surjectivity.
- Conditional rational singular-weight exhaustion for every a≥2 versus the separate large-weight theorem. The Q h1=h0 argument includes a=2. The totally real dimension formula retains its large-gap and packet hypotheses.

## Gaps and supplier requests

The packet and reader give all 33 exact requests and their consumer ids. Their principal owners are AutomorphicBundles B0/B3/B4; SF.1/SF.2/SF.4; P7; ComplexComparisonPartII C2/C3; ShimuraCompactifications C4/C5 and Part II C13/C14; LP3; SR.0–SR.4; IHG.2/IHG.3; DD.6/CR.5; AS.4/AS.5; AF.2; ML.0/ML.4; R01.1/R01.5; and R19.1–R19.3. Fine nodes are used where they suffice. There are no invented stage ids for absent suppliers.

The six named gaps are:

1. **G-solid:** register and supply generic stable solid O-module operations, discrete comparison and filtered-support coherence. The proposed AnalyticStacks/SolidAnalyticRings owners do not exist in the current catalogue. The executable discrete proper-coherent route remains supplied by SF.2.
2. **G-models:** supply genus-two Hilbert–Siegel models, EO geometry, affine minimal images, regular-sequence thickenings and the prime-to-p G1 quotient/direct-factor statement. The genus-one Hilbert roadmap and Q Siegel C13/C14 do not provide this.
3. **G-boundary-regular:** establish non-containment of relevant EO components in the boundary and regularity of the boundary equation on every cofinal CM thickening used for termwise restriction injection.
4. **G-Harris:** inspect the primary Harris chapter and verify the rapid-growth/subcanonical map, the large-weight bound and full compact-group components. The existing AF.4 BHR node already records its missing full-group extension; it is not replanned here.
5. **G-Phi:** inspect the exact vector-valued boundary Hecke calculation or give a direct proof of the stated T_(ell,2)=2T_ell normalization. Freitag IV Satz 4.4 was unavailable. The full Satake-polynomial route is recorded separately; no division by 2 is used.
6. **G-formal-models:** verify Lan Definition 8.5 on Klingen/paramodular and quotient charts, including coefficient descent at boundary stabilizers. Singular-fan refinement does not remove this obligation.

Three restructuring proposals assign generic solid operations to a separate direction, add a Hilbert–Siegel geometric continuation and extend logarithmic de Rham/crystalline coefficient splitting and integral dual BGG in their existing direction. There are no moves of mathematics already owned by TauCetiRoadmap, and no supplier file was changed. Maintainer notes also flag the parent associated-bundle ownership link and the existing AF.4 compact-component obligation.

## Sources and version discipline

The packet’s `sources` and `sourceVersions` record the exact public URLs, editions, access date, inspected sections/pages and hashes where available. The reader lists all node locators. All statements and findings use our own words. No source passages, source files or extracted texts are included.

Primary texts inspected:

- CG18, author copy of Invent. Math. 211 (2018), §7.2, printed pp. 395–401.
- CG20, *Minimal modularity lifting for non-regular symplectic representations*, author copy of Duke Math. J. 169 (2020), pp. 822–831, 833–834, 836, 839, 851–855 and 887–888.
- P20, maintainer-cleared author manuscript of 17 June 2019: §4.3 p. 19; §5.3 pp. 24–25; §6.2.2 p. 30; §14.8–14.9 pp. 101–105; §15.2 pp. 108–110. The Duke version of record was not collated; findings are scoped to the author manuscript.
- BP26, author manuscript of 5 November 2025: §1.1/§1.3 pp. 2–4; correspondence definitions pp. 7–9, 14, 17; coefficient/group base change and transpose pp. 21–24; filtered action pp. 28–29; integral torsor pp. 46–47; relative vanishing p. 58.
- BCGP21, publisher version: §3.3.3 pp. 204–205, §3.9 pp. 226–232 and §3.10 pp. 236–240.
- Sch15, maintainer-cleared arXiv manuscript, Corollary V.1.7 and proof p. 83; published locator §5.1 pp. 1035–1036 is distinguished.
- Su24, arXiv:1810.12056v2: §§1.1–1.1.2 pp. 6–10, Propositions 3.14/3.16 pp. 35–36, Proposition 4.1 p. 37 and §5 pp. 54–55.
- Lan17, corrected author manuscript of *Integral models of toroidal compactifications with projective cone decompositions*: §7 pp. 28–32 and Definition 8.5/Theorem 8.6/Remarks 8.9–8.10 pp. 34–35. It is not the separate *Higher Koecher’s principle* article. The complete one-page published errata was inspected.
- Lan–Suh, author manuscript, §§7.2–7.4 pp. 40–44, together with the complete two-page published errata. The GSp4 specialization uses p>2 and Corollary 7.24, not the uncorrected general §8 degree statements.
- Harris–Zucker III, §3.2 pp. 61–63, including the induced boundary terms and component corrections.
- Brasca–Rosso arXiv:1605.05065v1, Proposition 1.14 and Remark 1.15 pp. 11–12; this is Proposition 1.5.8 in the version cited by BCGP.

The primary Harris 1990 Perspect. Math. 11 chapter and Freitag IV Satz 4.4 were not available in the cleared library or located in an inspectable permitted source. Their precise missing uses are G-Harris and G-Phi. Public author-site and arXiv/publisher searches for existing corrections are recorded; findings not already covered by published errata are submitted for independent verification, not asserted to be new discoveries.

## Validation and resumption

- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicBundlesPartII.json`: zero errors, zero warnings.
- `python3 research/blueprint/intake.py check-files` on all five deliverables: five files, zero problems.
- `python3 scripts/check_sorry_data.py research/blueprint/suggested/AutomorphicBundlesPartII.lean`: passes.
- `source_issues.check_issues` and `check_errata.versions_checked` on the packet: pass.
- `lean-check research/blueprint/suggested/AutomorphicBundlesPartII.lean`: exit 0 at the pinned shared build, with only `sorry` warnings. The suggested file is 171 lines, has two real-bodied definitions and no data placeholders. Concrete chamber examples and the imported K-projective example check without admissions. The other theorem signatures remain proposed mathematics.

The reader carries every target, hypothesis, locator, API, definition check and worked comparison; it is definitive for heavy targets whose carriers do not exist at the pins. To resume, review source findings and the six gaps first, then close the supplier interfaces stage by stage. Do not convert an uninspected source or a conditional packet result into an unconditional theorem. The scratch directory contains no required handoff material and is deleted after submission.

One job was claimed. The bot confirmed claim comment 6262248619 in comment 6262250856. Priority selection encountered a GitHub 403 when trying to comment on the available focus assembly #7943 (over 2,500 comments), so that job could not be claimed; this session holds only #3423. No second job is taken.
