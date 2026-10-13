# PKG-SelmerIwasawaCohomology — #8892

Worker: Codex — codex-Z1qmzG. Date: 2026-10-13.

The three package files are written. This submission packages the accepted target-level plan; it does not certify that its prerequisite graph is closed or that any target is formalized. Only the package files and this handoff are changed. The accepted packet, reader and earlier signatures are untouched. The next step is independent package review, with the two inherited parity proof inputs below requiring particular attention before an upstream approval.

## What is delivered

The README opens with Summary, scope, conventions and exact supplier contracts, then five layers, worked examples, downstream consumers and edition-specific references. All 95 accepted targets are accounted for: 94 numbered sections plus one imported Kummer coefficient-transition theorem. All 154 API names survive after removing the old namespace prefix; definition/construction sections have at least three discriminating checks. Added APIs/checks spell out passage from finite elliptic Selmer to p-infinity and the algebraic/archimedean adapters. The correction-cone target precedes derived control and depends on the ambient base-change hypothesis rather than creating a circular prerequisite.

Suggested.lean is a compact file of real-bodied algebraic definitions, representative theorem signatures and 72 examples in 841 lines. Heavy arithmetic/derived carriers are README targets named in the closing comment. Proof fields and theorem proofs may use sorry; no data value is supplied by sorry. Finite pairing signatures use ZMod n, saturation has its explicitly scoped integer-module adapter, corank uses a supplied compact dual, and Fontaine–Laffaille's algebraic prototype does not assert a Witt-ring realization. metadata.toml is math.NT.

## Current-library ownership and removals

Read the current TauCetiRoadmap READMEs for GlobalNumberFields and HodgeStructures in full, and current AdicSpaces and ModularForms Suggested.lean as shape models. Searched the nine newer roadmaps and all four Completed roadmaps by the relevant mathematical objects, not only declaration names. Read the current local multiplicative completion and cohomology interfaces and the current Tau Ceti Kummer, continuous Shapiro, transpose-character and Hodge declarations. Read the 17 Selmer-related library-coverage entries and the cited pinned declarations.

- Removed the accepted L0/kummer-level-compatibility target entirely. Its supplier is current TauCeti.FieldTheory.GaloisCohomology.Kummer: explicitCoeff1_kummerCoeffPow_kummerMap, with kummerCoeffPow and explicitCoeff1_kummerCoeffPow_surjective. Finite Hilbert 90, Kummer bijectivity, restriction and norm are imported there too. The pins retain the injective class map; no new finite Kummer construction is proposed.
- LocalGaloisGroups Layer 7 already owns padicCompletionUnits, its transition maps/module and finite-p-adic-field rank/torsion. Layer 0 retains only the Mathlib comparison, topology and algebraic tensor failure.
- Current finiteIndex_range_powMonoidHom supplies local power-class finiteness. The retained target is the profinite-topology/limit comparison.
- Current ContinuousCohomology.shapiroIsoTopRep supplies all-degree discrete Shapiro. Only the complete finite-type coefficient extension and compact limit square are additional.
- Current instModulePadicCharacterContragredient supplies the algebraic opposite group-algebra action. The retained variant adds continuous p-primary duality and the completed Iwasawa comparison.
- EllipticCurves Layer 7 owns general discrete Selmer data, finite elliptic Kummer/Selmer/Sha and transitions. The retained diagram is the compact/rational extension and its canonical coefficient comparison; p-infinity passage is separately stated.
- HodgeStructureOn, dual, Tate/twist and conjugation are imported. The new datum is the complex-linear real Betti involution and its Gamma/criticality comparison. BDeRhamPlus/BDeRham and Gamma carriers are Mathlib-owned.
- Replaced FoundationsAndLibraryIntegration and UPSTREAM references by actual declarations/roadmap layers. PerfectoidSpaces P1/P3 supply the Fontaine inputs. Minimal periods, finite-condition comparisons and local exceptional terms move down from PadicHodgeRegulators; its higher regulators are consumers, never prerequisites.

## Accepted-plan proof inputs and supplier update

1. **Ordinary modular parity, README §4.28.** Nekovář Theorem 12.2.3 and Remark 12.2.4, pp. 421–422, give the stated specialization over Q and quadratic fields, with odd p, ordinary lambda, even weight and trivial nebentypus. The proof additionally uses ordinary-family parity variation (§§12.7–12.8), auxiliary quadratic nonvanishing and the rank-one Heegner argument (§12.10.9). These are not decomposed in the accepted graph. Do not treat Selmer duality/structure alone as a proof or import higher-tier PadicFamilies, Heegner or BSD. The package marks the precise missing input rather than inventing closure. Resume at the cited ordinary-family and Heegner arguments to determine their minimal lower-owner targets.
2. **Two-primary congruent-number parity, README §4.29.** Dokchitser–Dokchitser Theorem 4.19 (=1.4), pp. 593–594, explicitly imports p=2 from Monsky, Generalizing the Birch–Stephens theorem. I. Modular curves, Math. Z. 221(3) (1996), pp. 415–420, reference [26] on p. 596. That primary Monsky text was not read; neither its argument nor the root-number/descent comparison has a closed decomposition here. The precise infinite Selmer-corank conclusion and squarefree residue table are preserved, including divisible Sha. Finite Selmer-two dimension and rank without a Sha hypothesis cannot replace it. Resume with the actual Monsky argument, using only a permitted source copy.
3. **Real places at p=2, originally a third accepted gap.** The current reviewed ArithmeticGaloisDuality package now explicitly supplies D7.5, “Duality when p=2 and K has real places”. Read that statement and Nekovář §5.7.1–5.7.6, pp. 130–133. The package now imports its complete Tate real-place correction in the unbounded derived category. Ordinary global cochains are not truncated and integral compact support can have negative cohomology. Rationalization removes the real Tate terms. The displayed bounded integral duality/amplitude and cyclotomic rank formulas retain (P) or odd p; no unrestricted bounded Iwasawa amplitude/rank is asserted. The unchanged packet still records its older three gaps.

## Source checks and conventions

Read the relevant primary definitions, proofs and hypotheses across all 19 supplied sources, including the maintainer-cleared Liu–Tian–Xiao–Zhang–Zhu version of record. No private source or passage is included. Concrete checked locators include Rubin Appendix B §§2–5, Mazur–Rubin Definitions 1.1/1.6/2.1 and (2.4), Nekovář §§5.7, 6.1–6.3, 8.3–8.4, 8.9–8.10 and 12.2.3, Greenberg Propositions 2.6.3/4.1.1 and §4.4, CGLS Lemma 1.1.1/Proposition 1.1.3/Lemma 1.3.1, Bloch–Kato Proposition 3.8/Corollary 3.8.4/Example 3.11, Breuil Proposition 6, Nizioł Proposition 6.2, Fontaine–Laffaille Theorems 3.3/6.1/8.4 and Propositions 7.15/7.17, Deligne §5.3/Table 5.3, and Liu et al. Definitions 2.4.1–2.4.2 and Proposition 2.4.6. Deligne's scanned real/complex Gamma table was inspected as images.

Corrected Kato “Theorem 12.2” to §12.2, formulas (12.2.1)–(12.2.3), p. 220; its Q-case is distinguished from the general-number-field Euler supplier. Corrected Rubin “Corollary 6.4” in the elliptic comparison to §6.4 (Abelian varieties), display (9) and Remark 6.6, pp. 16–17. Jacinto–Williams locators use arXiv v2 pagination; retain the U/E quotient direction, real-tower base, ordinary decomposition-group stability and even-positive twist restriction. The original Perrin-Riou ordinary/finite equality was not authenticated; §4.12 instead gives a conditional finite/strict/inertia defect calculation from the explicit exact sequences.

## Adversarial mathematics pass

| Statements/interfaces | Instances computed | Result retained in the package |
| --- | --- | --- |
| Completion and tensor comparison | Q divisible; finite prime-to-p group; infinite valuation lattice of Q; local l not p | Completion is a quotient tower; unrestricted algebraic tensor comparison fails. Removed the overly broad double-dual comparison: p-divisible groups can have nonzero character double duals despite zero finite quotients. |
| Kummer coefficient limits | Algebraically closed field; finite field; R at p=2; finite roots of unity | Actual finite square and Hilbert 90; Mittag–Leffler holds for the finite H0 tower. |
| Invariant to coinvariant criterion | Identity; unipotent Jordan block at 1; Jordan block at 2 | Only the eigenvalue-one splitting is required; a nonsemisimple block away from 1 is allowed. |
| Orthogonal complements | Zero pairing; perfect cyclic pairing; strict/relaxed; finite ZMod double dual | Perfectness is bijective character duality, not merely injection; finite and continuous settings distinguished. |
| Selmer kernel and modification | Empty places; zero localization; all strict/all relaxed | Correct kernel; change map need not be onto a local quotient. |
| Mapping fibre | Global U=0 and local R in degree 0; identical H1 images with different H0 | H0 cokernel contributes to H1 of the fibre; no kernel-only identification. |
| Ordinary and finite conditions | Qp with plus=0; Qp(1) with plus=all | Strict/inertia/finite are distinct; valuation line and H0 defects survive. |
| Real places | p=2, Q, F2; rationalization | Complete Tate correction and unbounded integral context; odd-p amplitude unchanged. |
| Tower exactness | Finite reductions; lattice cohomology; norm maps multiply by p | Finite-type compact limits justify exactness; no false finite-length lattice assertion. |
| Derived specialization | Lambda in degrees 1–2 with differential X | H2 torsion contributes finite-level H1; Tor is retained in the correct next degree. |
| Determinant | Same X complex; move to degrees 0–1; positive free H1 | Inverse determinant is (X), then (X)^-1; positive rank needs regulator data. |
| Twist, dual and Euler actions | k=1, chi(gamma)=4; inverse character; arithmetic Frobenius | Cup twist is 1/4, contragredient is inverse, Euler uses l^-1 gamma. |
| Fitting/characteristic | Zero module; Lambda/(f); Lambda/(lambda,X); three-variable pseudo-null | Unit-ideal convention; finite-submodule and dimension-two hypotheses essential. |
| Bloch–Kato dimensions | Qp and Qp(1); general finite K/Qp | H0 term and [K:Qp] factor retained; semilinear Frobenius is not K0-linear. |
| Integral crystalline conditions | p>2 unramified; split versus pW filtration; unbounded reductions; ramified coefficients | Small range, uniform integral bound and inverse different all retained. |
| Hodge signs and Gamma poles | Tate twists 0,1,2,-1; opposite real sign; zero carrier | Type (n,n), native index -n, sign (-1)^n; totalized Gamma zero is not pole order. |
| Arithmetic dictionary/descent | Unit image zero; p=2 idempotents; finite Artin extension degree divisible by p | U/E direction; odd-p plus/minus; only finite restriction errors when required. |
| Elliptic and parity endpoints | Nonzero finite torsion; divisible Sha; twists n=1,5; nonsquarefree residues | p-infinity corank differs from finite Selmer dimension; missing parity proof inputs explicit. |

## Validation

- Accepted packet: scripts/check_blueprint.py reports 95 nodes, three inherited gaps, 20 requests, five planned stages, **0 errors, 0 warnings**. No packet edits.
- `lean-check research/blueprint/packages/SelmerIwasawaCohomology/Suggested.lean`: **exit 0**, 102 declaration warnings, all `sorry`; no Lean errors or other Lean warnings. Used the existing shared pinned build.
- `python3 research/blueprint/intake.py check-files` on the three package files and this handoff: **4 files, 0 problems**.
- Target/API cross-check: 95 accepted targets mapped to 94 numbered sections and the imported current Kummer transition; all 154 API names present; every construction/definition section has at least three Checks.
- Final staged `git diff --cached --check`: clean.

## Public source provenance

Access date: 2026-10-13. These are SHA-256 hashes of the public PDF bytes read; URLs identify the copies. The cleared private paper is identified by its published citation in the README, without a local path or copied bytes.

- [RUBIN-ES](https://swc-math.github.io/notes/files/99RubinES.pdf): `de47655dc35066fd01f2e76a37076ad03dee62e816130586c7674e520be73d50`.
- [MAZUR-RUBIN-16](https://arxiv.org/abs/1312.4052v1): `15ec72e48fab1790e5b96e7172b4af88c974b0d487a515cdbd9dd0ced3ea4ee8`.
- [RJW-PADIC-L](https://arxiv.org/abs/2309.15692v2): `efa1e10168fb092ffb072bbf147f85f07bea72d2a8f4907d6e9e4fd559c039c4`.
- [BURUNGALE-TIAN-26](https://arxiv.org/abs/2506.03465v2): `cbb8284a13ed40bd15df9713001485724bc4d2a3b5c38d8fd83f9b6f3f3e4664`.
- [NEKOVAR-SC](https://www.numdam.org/item/AST_2006__310__R1_0.pdf): `61c84e5ad3252a2e520747215ac57a282addc2b58c824a3637bcd77bbe02153f`.
- [GREENBERG-STRUCTURE](https://warwick.ac.uk/fac/sci/maths/people/staff/david_loeffler/jhc70/greenberg.pdf): `f51fd6dc94af58e0af949e4b6d7a5f24aaab8397703dec6dcfc3106b5387b5b0`.
- [CGLS-22](https://web.math.ucsb.edu/~castella/Eisenstein.pdf): `2bd32832411151a628136b245eada847f2f1b2e04872391bbe630e8e1a54819b`.
- [CG-APPENDIX-20](https://arxiv.org/pdf/1907.08694v1): `8389edfec6576b92aea1fd4dbf6c96ccb86b2186a6f244ab46c4abf1c02e2bed`.
- [SKINNER-20](https://arxiv.org/pdf/1405.7294): `9e4650618c83394c400a10e990759f9fba42113eedc79fe2fcbe029d6c8381ff`.
- [KATO-04](https://www.numdam.org/item/AST_2004__295__117_0.pdf): `3c6e14b11fa60262db8aff782ce3cf4d83e9100c0be83621a7e4ce502cec605d`.
- [BLOCH-KATO-90](https://virtualmath1.stanford.edu/~conrad/BSDseminar/refs/BKTamagawa.pdf): `ec89c6436c7e16580791eddd562c8c04a12442d8a8484f8ac75c5ea8dc04f5e5`.
- [DELIGNE-79](https://publications.ias.edu/sites/default/files/33_Valeursde.pdf): `6cfacb0f8742314fb9faeb3585159bdc13c3ff6e93686e3fe0a23ad775e8b574`.
- [DOKCHITSER-10](https://annals.math.princeton.edu/wp-content/uploads/annals-v172-n1-p11-p.pdf): `f13acec152f980adbe52b033f6bb20972a0e07ef995affb76c1f0bcbaaaa5306`.
- [BREUIL-99](https://www.numdam.org/article/BSMF_1999__127_3_459_0.pdf): `ccc0c9fd501377f07217ff149ff3bddda817c9df6f76f825c5ec48c01f67cfdd`.
- [NIZIOL-93](https://webusers.imj-prg.fr/~wieslawa.niziol/duke1993.pdf): `0cbb8dd04fc76284620049c435eb4757d6fb9f1ab347b11fdf1ae890fe975449`.
- [FONTAINE-94](https://www.numdam.org/item/AST_1994__223__59_0.pdf): `74b6bfbaa3a5b5a1eb1f1cd33b0e49aaffa5bde1b8761a91f7cb51a550e9a46e`.
- [FONTAINE-LAFFAILLE-82](https://www.numdam.org/item/ASENS_1982_4_15_4_547_0.pdf): `c049a7bff113a45f8bbcffc93118bd2e651e84f8b4a38305f7cb24b34c2011a2`.
- [FONTAINE-REP-94](https://www.numdam.org/item/AST_1994__223__113_0.pdf): `ace926ffda578dacfe8a333c38d450235506ebe18f558ee9bfcb96dc6f70a8ec`.
