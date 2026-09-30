# PAPER-CIUBOTARU-HARRIS-26: completion

Dan Ciubotaru and Michael Harris, *On the generalized Ramanujan and Arthur conjectures over function fields*, Ann. of Math. 204 (2026), 545–601 ([doi](https://doi.org/10.4007/annals.2026.204.2.3), [arXiv:2311.15300](https://arxiv.org/abs/2311.15300v1)).

Continuation by Claude Code, session `cc-39fac3`, 29 September 2026 (issue #1057). Status: **complete**. `check_paper.py` passes.

The extraction now has:
- 81 items: 1 library, 12 planned, 68 missing;
- the same four routes;
- 15 prerequisites;
- 8 source issues.

After the independent review (REV-PAPER-CIUBOTARU-HARRIS-26, research/blueprint/reviews/REV-PAPER-CIUBOTARU-HARRIS-26.md) the extraction has 83 items (2 library, 11 planned, 70 missing), the same four routes, 13 prerequisites and 17 source issues, all confirmed. The review read arXiv v1 (the Annals revision is still not served) and corrected the extraction in place:
- **Library.** `sl2-integral-spectrum` is built in Tau Ceti (`TauCeti.exists_int_of_hasEigenvalue`, `TauCeti.isInternal_eigenspace_toEnd_intCast`), so it is library, not planned.
- **Nine new source issues (E9–E17).** Three matter for the main theorem:
  - **E11 (error).** Corollary 6.32(1) is false for Satake parameters with a non-central compact part; a generic unitary spherical representation of G2 with ν = ½ω2 is a counterexample. The proof of Theorem 5.4 applies it to arbitrary compact parts.
  - **E10 (gap).** The sketch of Theorem 4.3 asserts geometric local monodromy "because G is semisimple", which the paper's own p. 3 says is not known.
  - **E12 (gap).** The reduction to adjoint G is written only for types C and D; types A, B and E7 need it too.

  The rest are misprints: E9 is the direction of N in Definition 2.6, and E13–E17 are small slips. E6–E8 are confirmed.
- **Items.** Fourteen statements are corrected, for example restricting the local temperedness tests to real Satake parameters. Two items are added: [GHS]'s purity of discrete series, and "spherical tempered implies generic".
- **Routes.** Route 1's area is set to `representations`, a galaxy id, so it coalesces with Mao–Wan–Zhang's proposal of the same Part II. The three Part II briefs now state their final theorems and name their imports: SmoothRepresentationsPartIIUnitaryDual, ES5 and ES7:parabolic.
- **Prerequisites.** V. Lafforgue (2018) and Gan–Harris–Sawin are already in the atlas batch and are removed. Collingwood–McGovern gets a link.

The earlier checkpoint's report follows below.

## What this continuation did

- **Reading.**
  - arXiv v1 was re-downloaded (SHA-256 `7261083b…`, now recorded) and read completely.
  - It is still the only arXiv version. The Annals revision (8 October 2025) is not accessible: the journal page links no PDF, and the conventional URL returns 404. So `published-version` stays open, and everything is scoped to v1.
- **Itemization (17 new items).**
  - Theorem 3.8(2)–(3) is planned: ExcursionOperatorsAndSpectralAction ES5 (the semisimple parameter assignment) and ES7:parabolic (compatibility with parabolic induction).
  - GlobalShtukasPartIIRamanujanArthur receives:
    - Li-Huerta's comparison of Genestier–Lafforgue with Fargues–Scholze;
    - Proposition 3.10(1)–(4);
    - Arthur's conjectures in Clozel's form, as the conjectural target;
    - the stack-purity alternative (Expectation 5.9, Sketch 5.10, Sun's theorem);
    - Xue's extension to finite-codimension Hecke quotients.
  - SmoothRepresentationsPartIIUnitarySpherical receives the genericity and hermitian criteria, Lemmas 6.7–6.8, Theorem 6.9 and the ε = 0 reduction (6.11)–(6.13).
  - LieHighestWeightPartIINilpotentOrbits receives Lemma 10.9's classical case (partitions and half-spin separation), the exceptional adjoint separation, and Tables 2–4.
- **Computation: Tables 2–4 and Lemma 10.9 certified.**
  - By Bala–Carter, the nilpotent orbits of a simple Lie algebra correspond to pairs (Levi subalgebra, distinguished parabolic of its derived algebra), and a 0/2 labelling is distinguished iff dim g₀ = dim g₂. Enumerating all subsets of simple nodes with exact rational arithmetic gives 5, 16, 21, 45 and 70 orbits for G2, F4, E6, E7 and E8 (distinct dominant h), and as many distinct adjoint gradings.
  - **All 91 printed rows** of Tables 2–4 (70 for E8, 16 for F4, 5 for G2) equal the computed dim gr_i for the orbit with the printed label, with the right i_max. The rows are pairwise distinct, and each sums to dim ǧ.
  - So the adjoint representation alone separates the nilpotent orbits of every exceptional type, **including E6 and E7**, which the paper did not tabulate.
- **Source issues (§18).**
  - The five findings of the reviewed errata job are copied verbatim with their review verdicts: E1–E4 misprints and E5 an error in Theorem 8.5's F4 B3 coordinate.
  - Three findings are new, all checked on the page images:

| id | kind | where | finding |
|----|------|-------|---------|
| E6 | gap | Appendix, proof of Lemma 10.9 | "If the claim holds for E8, it has to hold for all its Levi subalgebras, in particular for E6 and E7" does not follow as written. Equal gradings on a Levi's adjoint representation need not give equal gradings on e8. Even with all representations, restriction from E8 gives only E8-conjugacy: E7's (A5)′ and (A5)″ both become the E8 orbit A5. The conclusion holds by the direct computation above. |
| E7 | misprint | §1.1, p. 3 | "As a corollary of Theorem 1.1" refers to a nonexistent theorem; it should be Theorem 5.4 (Corollary 5.7). |
| E8 | misprint | Theorem 6.9, p. 18 | "the hermitian locus C₀" should be C_{0,h}. |

- **Other updates.**
  - **Prerequisites:** all five placeholder links pointed to the paper itself. They are replaced by 15 entries whose DOIs and arXiv ids were checked through Crossref and the arXiv API.
  - **Library audit:** at Mathlib 082e2d3 and Tau Ceti f790474, IsSl2Triple remains the only library item. Mathlib's `LieAlgebra.IsKilling.exists_isSl2Triple_of_weight_isNonZero` gives root triples, not Jacobson–Morozov. Neither library has nilpotent orbits, Satake, Aubert–Zelevinsky or Weil numbers. All planned stages were reread and cover their citations.
  - **Gaps:** the old `coverageGaps` are converted into `gaps` with statuses, and the old list is kept as `coverageGapsHistory`. Only `published-version` is open.

---

# Ciubotaru–Harris: extraction checkpoint

**Job:** PAPER-CIUBOTARU-HARRIS-26, issue #1057. **Worker:** ChatGPT (GPT-6 Astra Pro), session `c0-5fbc06`. **Date:** 2026-09-21. **Status:** partial.

The result contains 64 contracts: one positively identified library definition, eleven contracts assigned to existing planned layers, and 52 provisionally missing contracts, each routed once. Three Part II briefs take 8, 24 and 17 missing contracts; a source route to FunctionFieldArithmetic:FA.6 takes the remaining three. These are proposals for continuation and review, not accepted new roadmaps or a completed extraction of the published paper. In particular, `missing` outside the inspected declaration and owner scopes is provisional pending the remaining pinned-library audit.

## Source and version boundary

The paper requested is Dan Ciubotaru and Michael Harris, *On the generalized Ramanujan and Arthur conjectures over function fields*, Annals of Mathematics 204 (2026), no. 2, 545–601, DOI 10.4007/annals.2026.204.2.3. The [publisher record](https://annals.math.princeton.edu/2026/204-2/p03) gives a revision of 8 October 2025. The text actually inspected is [arXiv:2311.15300v1](https://arxiv.org/abs/2311.15300), dated 26 November 2023, 39 pages. Its [HTML](https://arxiv.org/html/2311.15300v1) and [PDF](https://arxiv.org/pdf/2311.15300v1) were used together.

The main text of Sections 1–10 and the appendix's proof narrative were inspected. PDF spot checks included printed pages 2, 26, 29, 32, 34 and 37, including the exceptional-parameter table. The appendix tables have not been independently certified. Matching title and abstract do not establish agreement with the accepted revision; every numbered locator in this packet refers to v1. Attempts to download the PDF bytes failed, although the web reader exposed its text and screenshots. Consequently the source hash is null, not an invented checksum. All these accesses were on 21 September 2026.

## What the proposed extensions actually add

The generic result uses three existing bodies of mathematics: global cuspidal parameters, Frobenius weights, and local smooth/Satake theory. The additional step is to use the classified generic unitary locus to exclude nonzero half-integral real parameters. The nongeneric branch needs nilpotent-orbit strata, their complementary series, and a comparison of generic and boundary weight multiplicities. It also retains a compatible global-parameter hypothesis outside the established cuspidal setting. See v1 Theorems 5.4, 1.11 and 10.3.

### Existing owners, not new foundations

`GlobalShtukasAndFunctionFieldLanglands:GS.5` owns the cuspidal excursion decomposition and unramified Satake compatibility. `GS.6` owns the full GL_n correspondence used for purity; `GS.7` owns local–global comparisons. Rebuilding shtukas or defining a second global parameter object in the consumer would duplicate those owners.

`SmoothRepresentationsOfLocalGroups:SR.2` owns normalized induction and Jacquet functors, `SR.3` the ordinary local temperedness theory, and `SR.4` the relative Satake dictionary. Historical comparison files still use `SmoothRepresentations`; the current extract and README use `SmoothRepresentationsOfLocalGroups`. The integral GL_n derivative theory of SR.5 is not a substitute for the general Aubert–Zelevinsky statements required here.

`DeligneWeightsAndPurity:DWP.0` owns Weil weights and their embedding conventions. `DWP.5` already imports inertia and monodromy carriers and proves the curve local weight theorem, including the Frobenius–N relation. `DWP.8` owns the strict weight filtration. A final owner check therefore moved `pure-wd` and `boundary-purity` out of the proposed global Part II and marked them as imports. Comparing the paper's Frobenius and filtration convention remains an application obligation, not permission to rebuild this theory.

`FunctionFieldArithmetic:FA.6` already owns function-field cusp spaces, fixed-level finiteness, coefficient models and eigenvalue descent. Proposition 3.1's explicit noetherian-coefficient and base-change statements, and Lemma 3.2's algebraicity consequence, are routed as **sources of FA.6**, not as a second automorphic foundation. Their precise coefficient refinements still need implementation-level decomposition.

### Three provisional Part II routes

**LieHighestWeightPartIINilpotentOrbits** extends the upstream highest-weight direction with the zero-triple adapter, nilpotent-orbit/triple comparison, filtered tensor functor and recognition from representation-indexed weight data. It imports the upstream sl2 classification and complete reducibility. The very-even orthogonal case requires half-spin representations; the standard representation alone cannot distinguish the two SO-orbits. This extension remains subject to a complete library and neighboring-owner search before acceptance.

**SmoothRepresentationsPartIIUnitarySpherical** extends local representation theory with the generic unitary regions, root-by-root half-integrality tests, nonsplit transfer, Kazhdan–Lusztig data and nilpotent complementary-series classification. Its endpoints are the local temperedness tests and the extraneous-parameter list, not another Satake transform. The proofs cited by the paper for these classifications must be read at their original sources before the brief becomes an implementation packet.

**GlobalShtukasPartIIRamanujanArthur** adds geometricity of the particular local/global parameters, removal of constant-field twists, finite-extension parameter lifts, and propagation of the weight constraints. Theorem 5.4 comes first. The nongeneric endpoints must retain the explicit global-parameter and same-nilpotent-orbit hypotheses. This route imports the two proposed extensions above and FA.6, DWP.0/5/8 and GS.5–7.

## Hypotheses and API checks that must survive refinement

Mathlib's pinned `IsSl2Triple h e f` includes `h != 0`. The paper also uses the zero nilpotent orbit. In characteristic zero, the relations imply that h=0 forces e=f=0, so the zero case can be a separate constructor followed by a comparison theorem. It is not definitionally the existing Mathlib structure. Its filtration has only weight zero.

The paper's geometricity condition includes algebraicity and absolute values under all complex embeddings. A half-integral real Satake part says nothing by itself about algebraicity of the compact factor. Conversely, equality of weight patterns in all algebraic representations determines the positive real part, not the entire semisimple parameter. These distinctions occur in Definition 2.5, Definition 6.3 and Proposition 10.2.

The distinguished generic place in Theorem 5.4 excludes the odd-dimensional quasi-split unitary case. Remark 7.6 explains the surviving half-integral candidate and the failure of the required spin representation to descend to the actual fixed dual group. This is a limitation of that local argument, not a constructed global counterexample.

Aubert–Zelevinsky preserves the semisimple local parameter in Proposition 4.5; it need not preserve its Weil–Deligne monodromy. The nonadjoint reduction in Section 5 restricts a Galois parameter to a finite extension to obtain a central-isogeny lift. It is not an assumed theorem of cuspidal automorphic base change.

For the nongeneric assertions, Section 9 distinguishes existing cusp parameters from a desired extension to the discrete spectrum. The introduction calls an input “Conjecture 9.3”, but (9.3) is a displayed decomposition and the numbered compatibility conjecture is 9.5 in v1. Xue's finite-codimension quotient result must not be promoted to a parameter for every residual representation. The report does not certify the step from Proposition 10.2's real-part recognition to the same nilpotent complementary-series stratum in the proof of Theorem 1.11.

## Exceptional coordinates retained for the next worker

The following are the **full real parts**, not just the displacement from h/2, transcribed from v1 Theorem 8.5, printed page 29. The omega_i use that paper's fundamental-coweight numbering. They are source data, not independently computed certificates.

| Dual type | Nilpotent orbit | Full real part |
| --- | --- | --- |
| F4 | B3 | omega_1 + omega_2 + (omega_3 + omega_4)/2 |
| F4 | A1 + tilde-A1 | (omega_1 + omega_4)/2 |
| E7 | D5(a1) + A1 | (omega_1 + omega_2 + omega_3 + omega_6 + omega_7)/2 |
| E8 | D6 | omega_1 + omega_4/2 + omega_6/2 + omega_8 |
| E8 | A6 | (omega_1 + omega_4 + omega_7 + omega_8)/2 |
| E8 | A4 + A2 | (omega_1 + omega_5 + omega_8)/2 |
| E8 | A2 + 2A1 | (omega_2 + omega_8)/2 |

Separate machine items and branching/weight certificates remain necessary. In the symplectic-dual proof paragraph, the text says an odd index where the theorem statement and centralizer decomposition require an even one. Several comparisons in Section 10.2 print n_v on both sides of a strict inequality. Check these against the accepted revision and actual weights rather than treating a plausible correction as a verified proof.

The appendix's columns labelled Fil_i have non-monotone entries: they cannot literally be dimensions of an increasing filtration. The continuation must explain them as graded weight multiplicities and recover cumulative dimensions by summation, or resolve the convention from a corrected source. The exceptional tables and the reduction through Levi subalgebras are still open verification tasks.

## A self-contained check: the finite weight array

The combinatorial content of Property A can be isolated from the arithmetic. Let a(i,j) be a finitely supported nonnegative integer array on Z² with a(i,i+k)=a(i,i-k). Write r_i for its row sums and c_i for its column sums. Either the array is diagonal and r=c, or at the largest index m where r_m differs from c_m one has c_m>r_m.

Here is a proof. Start above every index occurring in the support, and descend. Inductively suppose rows and columns above i have been cleared except for their diagonal entries. Then row i has no entries to its right, because those columns have been cleared. Reflection about (i,i) shows that it has no entries to its left either. Thus r_i=a(i,i), whereas c_i is a(i,i) plus nonnegative entries from lower rows. If c_i>r_i, this is the highest difference. If c_i=r_i, the lower entries in column i vanish and the induction continues. Finite support makes this a finite induction. If there is no difference, every off-diagonal entry vanishes.

This does not prove equality of the two weight functions in general. The array a(0,1)=a(0,-1)=1, zero elsewhere, has row sum 2 at zero and column sum 1 at each of -1 and 1; it is the elementary obstruction underlying Remark 10.8. The arithmetic application still has to construct the array with the correct row/column meanings.

An independent Python regression enumerated all 19,683 symmetric arrays with indices -2 through 2 and entries in {0,1,2}, and checked the alternative above, including the diagonal conclusion in the equality case. It separately checked the two-dimensional counterexample. These finite checks are not a replacement for the proof.

The E8,4A1 extra-region check was also reduced to exact integer inequalities. The source region has 0 <= nu_1 <= nu_2 <= nu_3 <= nu_4 and nu_1+nu_4<1, hence every coordinate is below 1. The two permitted half-lattice cosets give x_i=4 nu_i in {0,1,2,3} with common parity. There are ten ordered quadruples. Direct enumeration excluded each using the inequalities of (8.8), with no floating-point arithmetic. This verifies only that finite lattice exclusion, not the surrounding unitary classification.

## Evidence and validation ledger

The following are inspected repository evidence, not assertions that their whole mathematical developments are formalized.

| Evidence | Inspection and revision |
| --- | --- |
| `content/campaign/GlobalShtukasAndFunctionFieldLanglands/README.md` | Full README; blob `dffe4d9139a8e3a96c0c764132e9acc9f60e43e4`; GS.0–7 extract also read. |
| `content/campaign/SmoothRepresentationsOfLocalGroups/README.md` | Full README; blob `1aa900110c00666cf720298012bacb9cf0e6b153`; current renamed stage extract consulted. |
| `content/campaign/DeligneWeightsAndPurity/README.md` | DWP.0, DWP.5, DWP.8 and surrounding source/normalization context; blob `4334e5da8ff334237eb2790b5a5ca291b40fa26f`. |
| `content/campaign/FunctionFieldArithmetic/README.md` | Full README, particularly FA.6; blob `381203806f142fd8319da052e6d896cb363e3302`. |
| `content/tau-ceti/ReductiveGroups/README.md` | Full README; blob `a6e3c66b92dac794f2afd5725eb10c718dd11f4d`. |
| Upstream LieHighestWeight README and atlas extract | Standing conventions and early sl2/weight/PBW layers, not a full audit of every layer. |
| `research/blueprint/reviews/REV-AUDIT-20.md` | Full accepted review; blob `94151e7330c9f7998ded444615a21c54dc482d9d`. Used as scoped evidence when the combined coverage file was too large to retrieve. |
| Mathlib `Mathlib/Algebra/Lie/Sl2.lean` | Lines 1–130 at `082e2d37e8b0463410cdb532e111cd43d5a66174`; blob `56e7839a424f6bba2837d17534119ca07f147b47`. Positive citation is `IsSl2Triple`. |
| `scripts/check_paper.py` | Complete validator source read; blob `cf3cae9e7d2d41209bf9fa4d719fd6fe17a69f1f`. |

The Tau Ceti audit baseline is `f790474821cf4256814db967cb154e7af3d0c369`. A complete fresh search of that library and Mathlib for all 64 contracts was not performed. The reviewed audit supplies useful evidence about its own scope; it is not a substitute for that search. No broad absence claim here should be treated as newly verified at both pins.

An independent bounded check passed for JSON parsing, required contract fields, unique IDs, the consulted owner/stage identifiers, the three Part II briefs, the source route, and exactly-once routing of all 52 missing items. The full repository CLI `python3 scripts/check_paper.py ...` was **not run locally**, because the complete atlas/repository was not available. Repository CI must supply that check. No Lean file is required by this paper job, and none was produced or compiled.

## Completion work

The [handoff](../handoff/PAPER-CIUBOTARU-HARRIS-26.md) gives the resumption order. First match the accepted version and save its bytes/provenance. Then finish the primary-source audits: Gan–Harris–Sawin's discrete-series purity; Barbasch/Ciubotaru's unitary classifications and nonsplit transfer; Kazhdan–Lusztig and Reeder; Collingwood–McGovern and Carter; and Xue's exact quotient theorem. Their appearance in this paper's bibliography is recorded, not counted as reading their proofs.

Still to extract separately are all clauses of the local-parameter compatibilities and Proposition 3.10, several intermediate Section 6 lemmas, the complete exceptional case data, the quotient-parametrization statement and the alternative stack-weight route. The status must remain partial until these coverage, version, ownership and verification obligations are resolved. This checkpoint provides a map and checked small arguments for that work, not a claim that the whole paper is Lean-ready.
