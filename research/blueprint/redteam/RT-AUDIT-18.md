# RT-AUDIT-18 — red team of library audit AUDIT-18

**Result: 40 findings, 14 medium and 26 low, none high.** Every cited declaration exists at the
pins, and no layer verdict changes. The findings are:

- library material the notes call absent: étale cohomology, derived functors on D⁺, extension by zero, normalization
  finiteness and finite-level duality;
- claims stated more generally than the libraries prove them: Gauss sums over any finite ring, and generic smoothness over any
  base;
- `duplicates` lists that miss real owners or name consumers;
- fit labels and wording.

- **Red team:** Claude Code, session `cc-2aeb03`, 24 September 2026 (issue #1586).
- **Target:** `AUDIT-18`, the library audit of five roadmaps, accepted by `REV-AUDIT-18` on 17 September 2026:
  - `ClassicalArithmeticCompletion`;
  - `AdicCoefficientsAndComparisons`;
  - `ClassicalAdicEtaleCohomology`;
  - `DeligneWeightsAndPurity`;
  - `EtaleDualityAndPerverseSheaves`.
- **Baseline:** tauceti `f790474` and mathlib `082e2d3`, both read at exactly those commits.
- **Eligibility:** `cc-2aeb03` wrote neither `AUDIT-18` nor `REV-AUDIT-18`.

## Method

- **Every declaration claim.** All 557 `declarations` entries (254 targets, 49 layers) were located at the pins. Mathlib was
  read at `082e2d3` and Tau Ceti with `git show f790474:<file>`. All exist in the cited file at the cited line.
- **What each declaration says.** For every target marked `mathlib`, `tauceti` or `partial`, each cited declaration was read
  at the pin and compared with the target and the note: generality, hypotheses and the `fit` label. Where a note says an API
  is missing, the replacement was type-checked at the pin where that was quick. For example, `Sheaf.H` on the small étale
  site and `rightDerivedFunctorPlus` applied to `Sheaf.Γ`.
- **The absence claims.** Every target marked `absent`, and every `not built` layer, was searched for in both libraries under
  other names. None is fully present. Several are partly present, as the findings say.
- **Verdicts, summaries and duplicates.** Each layer verdict was checked against its targets, and each roadmap summary against
  its layers. Each `duplicates` entry was checked against the atlas: does the named layer plan the same mathematics, or only
  consume it?

Each roadmap was attacked separately; `checked` in the result file records what was read, roadmap by roadmap.

## Findings


### ClassicalArithmeticCompletion — 10 findings (2 medium, 8 low)

- **RT-AUDIT-18/1** (library-claim, medium). The note says the identities hold 'Over any finite commutative ring with a primitive additive character'. That is false.
- **RT-AUDIT-18/2** (library-claim, low). The target is marked 'absent', and the note calls the Tau Ceti genus-field result only 'the Artin map of the genus field of a quadratic field', next to the remark that the general Artin map's 'kernel and image are not determined'. In fact Tau Ceti proves Artin reciprocity for that extension: it determines the kernel (the ideals whose narrow class is a square) and proves surjectivity.
- **RT-AUDIT-18/3** (missing, low). The note says 'companion matrices exist only in rank 2 (Tau Ceti)', and the summary lists 'general companion matrices' as genuinely missing.
- **RT-AUDIT-18/4** (missing, low). The note says 'Missing: general Lucas sequences'. The sequences themselves exist in Mathlib as evaluations of the generalised Dickson polynomials.
- **RT-AUDIT-18/5** (library-claim, low). Three fit labels read 'more general' where the declaration is not a generalisation of the target statement.
- **RT-AUDIT-18/6** (error, low). The note says Tau Ceti has invariant factors 'only for Gram matrices of integral lattices'. That contradicts the audit's own Smith-normal-form target.
- **RT-AUDIT-18/7** (other, low). CA.7 ('Integral Galois modules and orders') is marked 'partly built', yet none of its own subject exists.
- **RT-AUDIT-18/8** (duplicate, medium). The duplicates list omits tauceti:TauCetiRoadmap/GlobalNumberFields#layer-11-orders-and-picard-groups.
- **RT-AUDIT-18/9** (duplicate, low). Two overlaps are missing from the duplicates lists.
- **RT-AUDIT-18/10** (other, low). The summary's 'Genuinely missing:' list reads as the roadmap's complete gap list, but it leaves out many gaps the layer notes record.

### AdicCoefficientsAndComparisons — 10 findings (4 medium, 6 low)

- **RT-AUDIT-18/11** (library-claim, medium). The target is labelled library 'mathlib' with the single declaration AlgebraicGeometry.Scheme.Hom.dense_smoothLocus_of_perfectField at fit 'exact', but that declaration is only the absolute case over a perfect base field.
- **RT-AUDIT-18/12** (library-claim, medium). The note says 'Missing: finiteness of normalization (no excellent, Nagata or Japanese rings in either library)'. The named notions are indeed absent, but finiteness of integral closure is partly in the libraries, and these are exactly the ingredients of the classical proof (Stacks §10.161: Noether normalization, then the separable and the purely inseparable cases) that normalization is finite for finite-type algebras over a field, the case L5's alteration geometry uses.
- **RT-AUDIT-18/13** (duplicate, medium). Four stages that plan L5 mathematics are missing from its duplicates.
- **RT-AUDIT-18/14** (duplicate, medium). The tame quotient of inertia and its identification with ∏_{ℓ≠p} ℤ_ℓ(1) are planned in two other places, and L6's duplicates record neither (only EDC.6 is listed). One is an existing Tau Ceti roadmap, which under PROTOCOL §15 is never re-planned and must be cited.
- **RT-AUDIT-18/15** (duplicate, low). This target is ClassicalAdicEtaleCohomology:H5's theorem (Huber's proper algebraic/analytic comparison). L4 requires H5 and only consumes the theorem, recording the maps.
- **RT-AUDIT-18/16** (duplicate, low). The entry says RF2:untilts constructs 'the same marked-untilt object L1 builds'. It does not.
- **RT-AUDIT-18/17** (library-claim, low). The notes list absolute noetherian approximation (Stacks 01ZA) and descent of finitely presented objects (01ZM) as missing, and cite only the smooth and étale special cases (Algebra.Smooth.exists_finiteType, Algebra.Etale.exists_subalgebra_fg). They omit the general affine statement those cases are built on.
- **RT-AUDIT-18/18** (library-claim, low). The note lists Tau Ceti's DVR models and numerical types but omits Tau Ceti's finite-base-extension package for DVRs, which is in the same StableReduction directory and bears on the target's 'finite base extension'. It is a finite separable extension with a chosen place, and Tau Ceti proves that its local ring is a DVR dominating R.
- **RT-AUDIT-18/19** (library-claim, low). The note says the tame quotient, its identification and 'its cohomology are absent'. The specific computation is absent, but the infrastructure for it is not.
- **RT-AUDIT-18/20** (library-claim, low). The note says Mathlib defines Hⁿ(X, ℤ_ℓ) 'with no theorems'. Two results about it are stated in the cited file, both for empty X: the coefficient sheaf is zero and the cohomology is a subsingleton.

### ClassicalAdicEtaleCohomology — 6 findings (4 medium, 2 low)

- **RT-AUDIT-18/21** (library-claim, medium). The note says 'Missing: RΓ and Rf_* as functors on D⁺ of sheaves'. That is false.
- **RT-AUDIT-18/22** (library-claim, medium). The target is marked 'absent', and the note says there is no j_!. Mathlib has the site-level restriction/extension adjunction for the localization at an object X of any site.
- **RT-AUDIT-18/23** (error, medium). The note says 'there are no étale sheaves on schemes over valuation rings to apply i*, Rj_* and j* to'. That is false.
- **RT-AUDIT-18/24** (duplicate, medium). Neither entry 'states the same targets', which is the duplicates field's definition in make_audit_jobs.py.
- **RT-AUDIT-18/25** (duplicate, low). In three places the audit's target wording absorbs what the stage takes from a named supplier, and it then records that supplier as a duplicate.
- **RT-AUDIT-18/26** (other, low). The parent layer H1 repeats, word for word, all 9 targets of its four sub-stages: H1:formal-adic-comparison (3), H1:henselian (2), H1:valuation-exports (1) and H1:valuation-nearby-cycles (3). The roadmap's 40 targets are therefore only 31 distinct ones.

### DeligneWeightsAndPurity — 7 findings (1 medium, 6 low)

- **RT-AUDIT-18/27** (library-claim, medium). The notes say that étale cohomology does not exist.
- **RT-AUDIT-18/28** (library-claim, low). The note says 'Pringsheim's theorem for power series in T (the form used for local Euler factors in q^{−s}) is absent'. It is not stated as such, but it is a direct instantiation of the cited Tau Ceti theorem, which the note labels only 'related'. Let P(T) = Σ c_k T^k with c_k ≥ 0 and radius R ∈ (0, ∞). Put a(n) = c_k when n = q^k and a(n) = 0 otherwise.
- **RT-AUDIT-18/29** (library-claim, low). Matrix.charpoly_transpose carries fit 'exact', but it gives only the dual half of the target, and only in matrix form.
- **RT-AUDIT-18/30** (missing, low). The target names Abel–Jacobi/Picard, but the note cites only the elliptic-curve divisor-class equivalence.
- **RT-AUDIT-18/31** (missing, low). Three atlas layers that plan the same objects are missing, one of them the genus-one case PROTOCOL §15 requires a general roadmap to cite.
- **RT-AUDIT-18/32** (duplicate, low). These entries record supplier/consumer handoffs, not layers that state the same targets, and their own notes say so.
- **RT-AUDIT-18/33** (error, low). The target attributes Weil I 1.6 to DWP.4. The stage exports only Weil I 1.7 (all complex conjugates of Frobenius eigenvalues on Hⁱ have absolute value q^{i/2}). The deduction 1.7 ⇒ 1.6 is owned by WeilConjectures:WC.3, as the audit's own duplicates note for this layer says.

### EtaleDualityAndPerverseSheaves — 7 findings (3 medium, 4 low)

- **RT-AUDIT-18/34** (library-claim, medium). The target is marked 'absent', and the note says only semisimple-ring injectivity (ℤ/ℓ) and a Frobenius-algebra criterion exist, 'self-injectivity of ℤ/ℓⁿ for n ≥ 2 is not stated'. The note misses that Mathlib proves the finite-level ordinary duality for finite abelian groups of exponent n. The duality takes values in a monoid with enough n-th roots of unity: biduality holds, the dual is exact because characters of a subgroup extend, and the dual is (noncanonically) isomorphic to the group itself.
- **RT-AUDIT-18/35** (duplicate, medium). EDC.7's duplicates list ET.2a:pure-decomposition and DWP.9 but omit DeligneWeightsAndPurity:DWP.8. DWP.8 owns the mixed-complex weight formalism that this target labels '(BBD 5.1)': weights ≤ w and ≥ w defined through D, and stability of the mixed category under the six operations with the directional estimates.
- **RT-AUDIT-18/36** (duplicate, medium). EDC.8's duplicates omit GlobalShtukasAndFunctionFieldLanglands:GS.3. It is the only other atlas stage whose own text plans cohomological correspondences, and it does so without importing EDC.8: its only prerequisite is GS.2. GS.3 is therefore planned to set up cohomological correspondences, with their action and adjunction maps, on shtuka cohomology independently of the general construction EDC.8 owns.
- **RT-AUDIT-18/37** (duplicate, low). EDC.3's four recorded duplicates (SF.5, MC.2, S.7, CP.6) omit two MotivicEtaleKTheory stages that plan the same objects without importing EDC.
- **RT-AUDIT-18/38** (duplicate, low). Ten duplicate entries name stages that are consumers of EDC, not stages that plan the same mathematics.
- **RT-AUDIT-18/39** (library-claim, low). The note says 'Only underived restriction of scalars for sheaves of modules and composition with a functor followed by sheafification exist.' Mathlib also has underived extension of scalars for sheaves of modules: the pullback of sheaves of modules along a morphism of sheaves of rings, left adjoint to restriction.
- **RT-AUDIT-18/40** (other, low). The note says 'Only the Rees algebra exists; no blowups of schemes.' Tau Ceti has a proved lattice-level blowup formula.


## For the verifier and the fixer

- **The étale-cohomology notes.** The most consequential point recurs across three roadmaps. Several notes say étale
  cohomology, or derived functors on étale sheaves, do not exist. At Mathlib `082e2d3`:
  - the small étale site exists;
  - étale sheaves on any scheme form a Grothendieck abelian category;
  - `Sheaf.H` is defined on them;
  - `rightDerivedFunctorPlus` gives RΓ and Rf_* on D⁺.

  What is missing is the triangulated structure on D⁺, the comparison Sheaf.H ≅ R^nΓ, and maps between the étale sites of
  different schemes. The notes should say exactly that.
- **No verdict changes.** The fixes are to notes, `library`/`fit` labels, cited declarations and `duplicates` lists, as each
  finding states.
