# Handoff: BP-ModularCurvesPartII--R13.3

Codex, session codex-bUxexK. Refs #774. Complete target-level planning pass continuing the first checkpoint; independent mathematical review is required. All ten checkpoint identifiers are retained, with hypotheses and conventions repaired. No implementation is claimed.

## Deliverables and coverage

The packet has 46 nodes: 20 constructions, 15 theorems, 7 comparisons, 3 applications and 1 definition. It has 109 API items, 75 definition/construction specification tests, four additional theorem checks for the corrected cusp count, 25 planets, one verified baseline declaration, 30 supplier requests and three explicit gaps. Every definition/construction has at least three distinct test kinds. The reader gives the full statements, proof routes, dependencies, APIs, tests, uses and acceptance criteria. The 160-line suggested file is the compact subset required by the current roadmap shape: light definitions with real bodies, end statements on existing carriers and checked examples. Heavy geometric carriers remain mathematical targets in the reader.

Accepted RS-06, including REV-FIX-2026-09-30, supplies the title, extension of ModularCurves, construction order and narrowed ownership. R13.4 owns no mathematics. For the checker's aggregate coverage requirement, the R13.4a coarse-construction and R13.4b Hecke-comparison nodes also carry R13.4 coverage credit; their actual parents and prerequisites remain the two mathematical suppliers.

| Stage | Status | Work remaining after independent review |
|---|---|---|
| R13.3 | planned | Supply effective polarized proper formal algebraization and the refined-stack/decontraction interface; review the corrected cyclotomic component and marked-twist labels. |
| R13.4 | closed, process aggregate | Its mathematical targets are supplied by R13.4a and R13.4b. |
| R13.4a | planned | Discharge coarse finite-inertia/completion and refined-stack comparisons, with finite-normal uniqueness checked on every component. |
| R13.4b | planned | Reconcile generic components, cusp fields and map conventions with R12.3/R12.6, then verify coherent and integral realization comparisons. |
| R13.5 | planned | Compute wild level-dividing 2/3 invariant completions and resolution, including the small-level coarse cases in the finite R20 audit. |
| R13.6 | planned | Export those missing branch/thickness/Hecke maps and compare the R20 character-group matrix conventions. |
| R14.1 | planned | Discharge integral trace and finite-correspondence descent requests; verify the projective-boundary cyclicity filter independently. |
| R14.2 | planned | Supply relative norm/principal polarization and the exact integral modular-symbol lattice comparison. |

Seven mathematical stages are planned; none is claimed closed. The explicit remaining lists are also in the packet. The complete status means the target pass is complete, not that supplier contracts or formalization have been discharged. Accepted open stages require follow-up packets, rather than another checkpoint extending this pass.

## Existing owners and pins

Mathlib is pinned at 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti at f790474821cf4256814db967cb154e7af3d0c369. The one baseline citation, HeckeRing.GL2.heckeT_mul_of_coprime, was read in the shared pinned source and imported successfully by the suggested file. It gives the coprime product for the full-subgroup integral GL₂ algebra; it does not establish the repeated-prime cyclic formula.

The read-only current ownership audit used TauCetiRoadmap 0d144d044dacebca17b654695b6f1ad58f159b27 and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. JacobianChallenge and StableReduction README files were read in full; the ModularCurves deformation and Layer 10 passages and their Suggested statements were read. The nine post-snapshot roadmaps were screened in their current README/Suggested files for these modular inputs.

Import the current equation-level Tate curve instead of planning its coefficients again. Import the prime N≥5 diamond compactification over ℤ[1/N], including cusp widths, the 2/3 stabilizer table, finite-flat j-fibre and Cartier boundary distinctions. New work here extends to composite/small levels, level-dividing primes and the proper generalized family. The field Jacobian theorem is not promoted to a relative theorem. Relative Picard representability and infinitesimal lifting belong to AlgebraicModuliForArithmeticGeometry A0-extension; curve norm/principal polarization is an explicit extra contract with that owner and AbelianSchemes A2.

General stable reduction, graph theory, surface blowups/contractions and Néron theory remain imports. R13.6's upward prerequisite on Weights R34.3 is replaced by the exact lower-tier LPV.7 semistable-curve nodes. The modular-nearby-cycle-interface fixes H¹/H₁, the Tate twist, noncanonical splittings and ramified thickness changes. R14.1 imports abstract Hecke algebra and duality traces; R14.2 compares the actual ModularForms Layer 8 integral image without an R14.3 dependency cycle.

## Reading and findings

All nine inspected public source files have URLs, version descriptions, SHA-256 hashes, access dates and target-specific reading locators in the packet/reader. No source passage or source-by-source exposition is reproduced. Material outside the cleared Katz–Mazur Chapter 5 extract was not used; the required local and boundary claims were verified in the public Conrad, Česnavičius and Edixhoven sources instead.

Read Conrad's author PDF §2.5, pp.16–18 and §§4.3–4.5, pp.37–48; Česnavičius Lemma 4.7.1, Theorem 5.13 and §6, pp.49,60–65; Edixhoven §§1.1–1.4 and §§2.1–2.4, pp.33–48,55–64; Ribet–Stein §3.9/3.10.2 and Conrad's Chapter 5, pp.44–48,63–73, with the ordinary subgroup closure on pp.77–79. The added-paper scope is routed explicitly: Masser–Zannier §3.1 polynomial; Bakker–Tsimerman §2 modular boundary/correspondences and §6 degree; BDMTV §6.2–6.3; Gross–Zagier I §§1–2, III §1 and V §1. Calegari–Geraghty/CDT group-tree inputs belong to R14.4, outside this part, and are not claimed read.

Six source findings need independent review:

1. Gross–Zagier III Proposition (1.4), p.255 omits ordinary mixed extra-automorphism points; Edixhoven §§1.1.4–1.1.5, pp.35–36 already corrects this.
2. Bakker–Tsimerman's projective scalar framing retains central inversion; its coarse quotient is not the fine universal-family problem.
3. Their cyclic degree/cusp union must use ψ(m) and the cyclicity filter; the unfiltered σ₁(m) union includes E[2] at m=4.
4. Their auxiliary polygon map domains are the component groups of the actual source polygons; the auxiliary map has degree d², not the quotient-isogeny degree d.
5. Raw p-gon inertia has order 2p; effective cusp inertia after inversion rigidification has order p, matching effective interior orders 2 and 3.
6. Conrad's inspected author PDF Theorem 4.3.4, p.38 overcounts d>2 cusp components, and Theorem 4.3.6, p.40 asserts a nonexistent unique positive-divisor lift. The corrected count is φ(d)/2 copies of the cyclotomic integer ring, with b modulo sign. The related marked twist keeps the b′ inverse. The component overcount is also identified in Frederick Vu's UCLA dissertation §3.2.2, as found in institutional indexed text. No comparison with the inaccessible Conrad journal text or unavailable dissertation PDF pagination is claimed.

The Bakker author erratum was inspected: its metric/CM and bicusp corrections do not address findings 2–5. All findings record the versions and searches, distinguishing known corrections from new checks. The author-version limitation on finding 6 is deliberate.

## Validation and continuation

The final blueprint checker reports zero errors and zero warnings. Intake path/local-path/JSON checks pass for precisely the three issue deliverables plus this handoff; check_sorry_data and git diff --check pass. The suggested file elaborates with lean-check at the shared pinned build, exit 0, with only two sorry warnings for its general counting end theorems. No library build or Lean language server was started.

Checked mathematical controls include full/cyclic subgroup counts at 1,4,6,9, exclusion of the scalar (2,2,0) branch, exact divisors of 12, corrected cusp degrees at (N,d)=(4,4),(5,5),(15,5), split-Cartan graph/genus/ramification at k=1,2,3, and the characteristic-2 Bézout certificate for the first Baran quartic. The quartic's argument covers geometric points, rather than just rational points over 𝔽₂. These essential controls survive in the Lean file and reader; they do not depend on scratch files.

Review should start from the three gap records and the R20CaseAudit, then check the corrected cusp labels and full/cyclic convention, the p² model's four vertical components, the first Baran model at 2, and the integral upper/lower adjoint and lattice comparisons. The source URLs/hashes and exact supplier IDs are in the packet, so follow-up work needs no private scratch material. Scratch downloads, scripts and logs are removed after submission; no second issue is claimed.
