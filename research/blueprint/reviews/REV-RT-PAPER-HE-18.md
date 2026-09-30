# Independent verification of RT-PAPER-HE-18

Reviewer: Codex, session `codex-J6LwjP`, 30 September 2026. Job `REV-RT-PAPER-HE-18`, issue #4253. Reviewed repository base `b4307ac401f397fcaeb0d67643d48917c0d8a4f9`.

Eight findings are confirmed (1, 2, 4–8, 10); two are rejected (3, 9). The confirmed medium findings are 1, 2, 4, 5 and 6. Confirmation includes the scope corrections below: a false proof step is not a disproof of its theorem, shared foundations do not erase application-specific results, and an existing algebraic carrier does not supply its analytic comparison.

## Independence and evidence boundary

This session did none of PAPER-HE-18, REV-PAPER-HE-18 or RT-PAPER-HE-18. Checked their result/report/review/handoff attribution: the extraction names Codex sessions a71f92, 7e92bd and c83e7a and Claude Code cc-fb70e5; its review is cc-7b31c4 and the red team cc-f805bf. Earlier work by this session on the Dor red-team verification concerns some common representation-theory owners but is not evidence for these verdicts.

Read all ten red-team findings and the red-team report, the target items/source issues and routes implicated by them, the relevant atlas stage descriptions and comparison-packet items/briefs. Searched all 123 HE18 items for a producer of the G-valued quotient map. This is verification of the ten findings, not a new claim to have independently re-extracted all 123 items or re-audited every declaration mentioned elsewhere in the packet.

## Primary sources opened

- [He, published article, DOI 10.1017/fmp.2018.1](https://doi.org/10.1017/fmp.2018.1), [working Cambridge PDF](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/803823BBCAD2701B79B7C5C7BF72C1B5/S205050861800001Xa.pdf/cocenters-of-dollarpdollar-adic-groups-i-newton-decomposition.pdf): read the cited definitions and arguments on printed pp.5–9, 11–13, 15–16, 18, 20–21 and 24–26. Local download has 27 PDF pages, SHA-256 `6fe62c1f7068e0709e9b6e4d1aefe3f0df1dce278061406f5d460c69c225e9b6`; Cambridge's per-download stamp makes this an artifact hash, not a reproducible version identifier. The original underscore-separated PDF URL returned 404; the hyphenated URL above worked.
- [He, arXiv 1610.04791v3](https://arxiv.org/pdf/1610.04791v3): compared the disputed statements/proofs and locators, especially Theorems 5.3 and 6.3 and the latter's full proof on p.19. SHA-256 `605d7e9cbf381d482969cd5ced70eb501d13df7614f91145d3986a3eb6115b7c`.
- [Haines–Rapoport, On parahoric subgroups](https://arxiv.org/pdf/0804.3788): read the strictly henselian setup, Remark 9 descent and Proposition 13. SHA-256 `56bc9b5fd49e3f3ab2ea3c976417f558d6760b17e69c467dcaaf279116d381f8`.
- [Gross, Parahorics](https://people.math.harvard.edu/~gross/preprints/parahorics.pdf), 18 June 2012, introduction pp.1–2: the relation between congruence kernels and the refined barycentric filtration. Its opening assumptions are split absolutely simple simply connected; it is not used to assert nonsplit proof closure.

All readings above were made on 30 September 2026. Mathematical counterexample and module calculations below were checked independently on paper; they have not been formalised in Lean.

## Pinned library and owner checks

The following declarations were opened at the exact pins, not inferred from current upstream names:

| Pin and file | Inspected content |
| --- | --- |
| [Mathlib 082e2d3, HeckeRing/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/HeckeRing/Defs.lean) | `IsHeckeTriple`, `HeckeCosetModule`, `HeckeRing`; submonoid parameter and finiteness assumptions |
| [Tau Ceti f790474, HeckeRing/Basic.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/HeckeRing/Basic.lean) | `toSet`, `rep`, `eq_iff`, `DecompQuotient` |
| [Multiplicity/Basic.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/HeckeRing/Multiplicity/Basic.lean) | finite decomposition-pair count and `multiplicity` |
| [Multiplication.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/HeckeRing/Multiplication.lean) | `structureConstants`, `mul`, `single_mul_single`, `mul_single_single_of_mulMap_eq` and their hypotheses |
| [Associativity.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/HeckeRing/Associativity.lean) | mixed-level associativity and semiring/ring instances |

Compared the reviewed coverage/baseline evidence and HE18's own audit with these statements. Read RG2.1/RG2.3/RG2.4, SR.1 and BG0/BG1; the relevant HE18 Part II briefs; Kisin–Zhou N08/N09/N15; van Hoften A08/A09; HKW22/033 and /126; Hansen26/kazhdan-density; Fintzen21/7 and /7a; and GHS24/28-moy-prasad with their routing. The BunGAndNewtonStrata packet's 23 nodes contain no straight-element supplier. A route to a candidate is not itself an existing planned stage.

## Verdicts

### 1. The Kottwitz map on G — confirmed

Published §1.1, p.6, and §2.6, p.12, distinguish the quotient of G by its parahoric-generated subgroup from the invariant already defined on the Iwahori–Weyl group. A7 supplies the extended Tits-system ingredients, while C1 only defines the latter invariant; neither supplies the map on G used by N8 and the rigid-support argument. Add the quotient homomorphism kappa_G:G→Omega, with kernel G_0, its constancy on Iwahori double cosets and theta-equivariance. Prove kappa_G(hg theta(h)^−1)=kappa_G(g)+(1−theta)kappa_G(h), then pass to Omega_theta for twisted invariance and N8's disjointness. Route the local quotient construction by source to RG2.4, with A5/A7 prerequisites and a precise supplier interface. BG1's arithmetic Kottwitz map is a separate comparison, not a substitute for this F-rational interface. Do not identify the Omega-valued map itself with a twisted-conjugacy invariant.


### 2. Rigid-support truncation and finite relations — confirmed

The displayed decompositions in the published proof of Theorem 23, pp.24–26, and arXiv v3 Theorem 6.3, p.19, require support stable under twisted conjugation. Theta-stability of Omega_0 does not suffice: its saturation under (1−theta)Omega is needed. The PGL_3 example works over C with omega=1 and theta(g)=J(g^T)^−1J^−1. Strengthen the red team's example to meet the proof's kernel-vector premise: put 1_I in the (I,0) component and −1_I in the (P,0) component for the theta-stable hyperspecial P=PGL_3(O_F) containing I. Their sum is zero, and Omega'=Omega_0={0}. A length-zero generator tau has kappa_G(tau)=1 in Z/3 and theta acts by −1. Thus the class of 1_I equals the class of its twisted translate, supported at kappa_G=2. This common class is nonzero: Haar integration is a theta-invariant functional and takes nonzero value on 1_I. The two claimed cocenter summands therefore intersect. Record this as a source proof error, amend E2's truncation explanation and E6's assertion that the field argument is standard. Saturating Omega_0 is not a general finite repair, since (1−theta)Omega can be infinite. The finite-A assertion additionally needs a finite-relation/linear-compactness argument after a valid support reduction; mere finite-dimensionality of the target restrictions does not supply that interchange. Preserve R16's direct compact-support gluing approach over arbitrary coefficient rings, with its proof obligations. This finding does not disprove Theorem 23 itself.


### 3. Noetherian coefficients and the quantifier on the bound — rejected

The ring calculation is correct but does not disprove the existential bound actually printed in Theorem 20. In R=F_3[x,z]/(xz,z^2), Ann(z)=(x,z) needs two generators, so the proof's particular choice N_nu=1 fails for G=Q_2^× at the first level. However the theorem says there exists a constant N_nu, not that it equals the number of minimal Weyl elements. At every level put d=[I:I_n]. For this abelian example with omega(g)=(1+z)^{v_2(g)}, the restriction module is Ann(z)^d: equivariance forces each coordinate into Ann(z), and arbitrary such coordinates extend by Haar integration on the d cosets, since their indices are powers of 2, invertible in R. It is generated by 2d elements, so N_nu=2 satisfies the printed conclusion for every n in the proposed counterexample. Moreover E3.correction already says only that Noetherianity gives finite generation of a submodule, which is what Theorem 18 uses; it does not assert retention of the proof's numerical constant. The prior review's wording can be clarified to distinguish those claims, but the proposed new Noetherian counterexample to the printed existential statement is invalid. This rejection neither proves that statement for all Noetherian rings nor repairs its proof; retain E3's existing arbitrary-ring error and the field-only scope of F3.


### 4. One owner for straight Weyl combinatorics — confirmed

Compared HE18 C6–C9 and route 6 with Kisin–Zhou N08/N09/N15, van Hoften A08/A09 and their actual route briefs, and BG0/BG1 and the BunGAndNewtonStrata packet. The theta-straight definition specializes to their sigma-straight definition, and no mutual import coordinates the combinatorial classification. Confirm the ownership omission. Name the RootSystems Part II continuation as supplier for the combinatorial definition and straight-class classification, and record reciprocal changes for the other packets' maintainers. Keep the comparison with B(G), its Kottwitz/Newton classification and the ADLV consequences in their own owners: these are not identical to HE18 Theorem 6. Kisin–Zhou N15 also cites He14 Theorem 3.7, so do not present the whole B(G) comparison as merely HN14 Theorem 3.3 without its arithmetic bridge. Correct the proposed status change: a candidate Part II identifier is not an existing stage. N08/A08 remain missing with an exact route/import obligation until an actual supplier stage or accepted definition plans their statements; do not set planned solely by naming the candidate.


### 5. Shared cocenter foundations and character theory — confirmed

HE18 H9–H13 and route 7 plan weighted conjugation, the equality of commutator and coinvariant relations, the resulting cocenter and invariant R-linear functionals. HKW22/033 and /126 and Hansen26/kazhdan-density route ordinary harmonic-analysis inputs to CharactersPartII without naming this supplier. Confirm the missing ownership/import boundary for the common foundations, not duplication of all their theorems. Have NewtonCocenters Part II supply H9–H13 using the existing Representation.Coinvariants carrier, and CharactersPartII import the theta=id, omega=1 specialization with explicit coefficient assumptions. HKW22/033 uses the strongly regular semisimple open subset, not all G; its orbital-integral isomorphism needs that restricted test-function representation and further hypotheses. Trace Paley–Wiener, Kazhdan density and trace separation remain CharactersPartII results, and are not automatic over every Z[1/p]-algebra. Add this boundary to HE18's brief and a reciprocal request for the out-of-scope character packets. Do not relocate B(G) theory or affine-Hecke cocenters as part of this fix.


### 6. Existing Hecke ring and the missing analytic comparison — confirmed

Freshly read Mathlib HeckeRing/Defs.lean:75,183,189 and Tau Ceti HeckeRing/Basic.lean:112–225, Multiplicity/Basic.lean:70, Multiplication.lean:56,95,124,137 and Associativity.lean:457–485 at the mandated pins. The free double-coset module, Shimura multiplicities, product and ring instance are present, whereas the extraction's audit records only coset/decomposition carriers. Add these available declarations and make the comparison with them explicit in H6 and L10. Qualify the diagnosis: H6 already says to reuse the coset carrier, and SR.1 explicitly forbids a second product; its missing status is correct because compact support, the basis comparison and compatibility with Haar convolution are not supplied by those algebraic declarations. Use Delta=top:Submonoid G in HeckeRing Delta K R, not the ill-typed HeckeRing G K R. For compact open K prove the Hecke-triple finiteness conditions and the R-module comparison; convolution corresponds to mu(K) times the existing product after checking coset conventions. This is not an unscaled ring isomorphism in general, and mu(K) need not be a unit in R. For L10 retain the geometric counting work proving the single-target mulMap condition and multiplicity at most one; then use mul_single_single_of_mulMap_eq. The pinned declaration does not prove those local-group hypotheses.


### 7. The lattice error already occurs for a torus — confirmed

Published §1.1, p.6, and Haines–Rapoport's strictly henselian setup, Proposition 13 and Remark 9 establish the distinction between inertia coinvariants and descent by Frobenius invariants. For the unramified norm-one torus T of a quadratic extension, X_*(T)=Z, inertia is trivial and Frobenius acts by −1. The F-rational quotient T(F)/T(F)_0 is zero: T(F) is the integral norm-one group with connected reductive special fibre. But full Galois coinvariants of the lattice are Z/2. Every torus is quasi-split as a reductive group, so E8's diagnosis must not suggest quasi-split groups avoid the problem. Add this example to E8/G1 and the A2/A8 acceptance checks. Keep Lambda=Z(F)/Z_0 as the intrinsic general definition. The formula (X_*(T)_I)^sigma is appropriate for this torus/descent comparison; do not substitute a nonexistent torus T=Z for every non-quasi-split minimal Levi. In this example tensoring with the reals kills the discrepancy and leaves the real apartment unchanged.


### 8. Version-of-record metadata — confirmed

The extraction has no sourceVersions field despite five sourceIssues marked as affecting a stated result; its source.readSections records a published reading and comparison, while data/collation.json provenance classifies PAPER-HE-18 as preprint. PROTOCOL §18 requires the metadata. The versions_checked validator reports the missing-field error when applied to this paper and its sourceIssues. Do not treat every diagnostic from invoking the errata-file CLI on a paper packet as a paper error: its other checks expect an errata schema. Add the published DOI/PDF and arXiv v3 entries with truthful reader/date provenance. The v3 SHA-256 is 605d7e9cbf381d482969cd5ced70eb501d13df7614f91145d3986a3eb6115b7c; the Cambridge PDF is stamped per download, so its hash is only an artifact identifier. Refresh generated collation through the normal authorized pipeline; do not hand-edit unrelated generated data in a narrowly scoped fix. This is a metadata omission, not evidence that the prior extraction never read the publication.


### 9. Barycentric integer levels versus the general Moy–Prasad filtration — rejected

The proposed status downgrade is not established by the cited mismatch. A3 plans the integer-depth barycentric congruence filtration, not the full real-indexed filtration at every building point required by Fintzen21/7 and GHS24/28-moy-prasad (or Fintzen's separate Lie/dual lattices). RG2.1 supplies valued-root filtration data; RG2.3 explicitly plans smooth affine parahoric models with prescribed root charts, pro-p congruence subgroups and compatibility. These are the relevant construction layers for A3's restricted object. Gross, Parahorics, introduction pp.1–2, explicitly describes integral congruence kernels and their refinement by barycentric Moy–Prasad groups in the split simply connected case; this demonstrates why the two requirements must be distinguished, not a proof of all nonsplit compatibility claims. A planned classification records ownership, not completed proofs; A3 already records the source-closure gap G2 and the exact stability/coordinate API that must be supplied. Other extractions' missing status for a broader family does not force this specialization to missing. The suggested repair also says Omega fixes the point, whereas A3 correctly distinguishes the reduced apartment from enlarged central translations and requires separate toral-coordinate compatibility. Retain that qualification. No additional item or rerouting is justified by this finding. GHS24 is currently a partial packet, so describing both comparison extractions as accepted is also too strong.


### 10. Three source-issue record omissions — confirmed

Verified the final length inequality in published §2.6, p.13, Remark 8, p.11, and the introductory finiteness assertion in §0.6, p.5, against the corresponding v3 passages. G5 already identifies the omitted noncentrality justification but sourceIssues does not record it. Add a gap entry explaining that equal Omega_theta invariants fix the averaged central Newton component; W_0 acts trivially on that component, so the nonzero difference lambda_2−y_0 lambda_1 has zero central projection and is noncentral. Its translation length is then positive, giving the integer linear lower bound used in the proof. Record the omitted argument rather than a false disjointness theorem. Add the missing twisted-action subscript in Remark 8 as a misprint and extend E1's locator to §0.6. Choose fresh issue IDs after the substantive additions instead of hard-coding E16/E17. Refresh the correction search and record versions before assigning known:new; source comparison alone establishes the text, not absence of a later correction. These bookkeeping fixes do not change the established theorem scopes.

## Fix boundary and validation

Apply the five confirmed medium findings with the qualifications above; incorporate the three confirmed low findings when reconciling source records. Do not introduce the rejected Noetherian counterexample as a disproof of the existential theorem or downgrade A3 solely from the broader comparison packets. Preserve the existing arbitrary-ring gaps, candidate-stage distinction, coefficient restrictions, and reduced/enlarged-apartment qualification.

This job changes only the verification JSON and this report. Reciprocal edits in other paper packets, source-issue corrections and collation regeneration belong to the resulting authorized fix/maintenance jobs.

Checks: `scripts/check_redteam.py` on the review; exact one-to-one finding-ID and verdict count assertions; `research/blueprint/intake.py check-files` on both deliverables; `git diff --check`. No Lean file is part of this review and no Lean compilation was run.
