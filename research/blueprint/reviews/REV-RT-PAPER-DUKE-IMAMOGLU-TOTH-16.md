# Verification of RT-PAPER-DUKE-IMAMOGLU-TOTH-16

Agent: ChatGPT. Session: `gpt6-c84e12`. Date: 2026-09-30. Job: `REV-RT-PAPER-DUKE-IMAMOGLU-TOTH-16`, issue #4117.

## Decision and scope

**15 findings confirmed, one rejected (finding 8).** Confirmation means that the stated core defect needs repair, not that every sentence of the red team's remedy is correct. In particular, do not copy the proposed Laplacian conversion, deduplication procedure, blanket status changes, or numerical-theorem packaging unchanged.

This is an independent verification of the sixteen findings, not a new complete extraction of the paper or a re-review of all its source errata. This session did not author the extraction, its earlier review, the standalone errata review, or the red-team result. The provenance and claim discussion were checked before starting; claim comment 5909475680 was acknowledged by bot comment 5909477857.

The review snapshot is `cc9d0f2a873a9ab218ad1b9474623364271aedb8`. Input blobs are `108c1146cb6a8f2d87362f00bcc42ffd1ed0caad` (red-team result), `94a4997c2186821b71ac64400ce962021d628c41` (DIT extraction), and `f473eb15fcd5cc2f450aeba26007919a746f8858` (standalone errata). Item numbers below refer to the DIT extraction at that snapshot.

### Evidence ledger

The published source is Duke–Imamoğlu–Tóth, *Geometric invariants of real quadratic fields*, Annals of Mathematics 184 (2016), 949–990, DOI 10.4007/annals.2016.184.3.8: <https://annals.math.princeton.edu/wp-content/uploads/annals-v184-n3-p08-p.pdf>. The relevant published text was consulted; page images were inspected for the Fourier normalization, Theorems 3–4, the numerical table, the Proposition 2 argument and the genus-character formula. Printed pages, not preprint page numbers, are used below. The PDF byte download failed locally. No PDF SHA-256 or fresh preprint collation is claimed by this verifier.

The following were read directly through the connector: WORKERS, BROWSER_AGENTS, PROTOCOL, UPSTREAM_GUIDE and the expansion protocol; the full upstream FuchsianOrbifolds and Multiquadratic roadmaps; the relevant QM, AS, GN, AL and AN stage descriptions; the BEY21 character row and its partial-review status; the cited portions of the extraction and the standalone errata; and `scripts/errata.py`, `scripts/check_errata.py`, `scripts/check_redteam.py`.

Library statements were opened at the required exact pins, rather than inferred from declaration names:

| Baseline | Files inspected for these findings |
| --- | --- |
| Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` | `NumberTheory/FundamentalDiscriminant.lean`; `LinearAlgebra/Matrix/FixedDetMatrices.lean`; `NumberTheory/NumberField/Units/DirichletTheorem.lean`; `Analysis/Complex/UpperHalfPlane/Metric.lean` |
| Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` | `NumberTheory/NumberField/NarrowClassGroup/Basic.lean`; `NumberTheory/NumberField/Quadratic/Conjugation/NarrowClassGroup.lean`; `NumberTheory/Modular/Stabilizer.lean`; `NumberTheory/Modular/Orbits.lean`; `NumberTheory/ModularForms/HeckeSlash/{Basic,Invariance,Composition}.lean`; `NumberTheory/Multiquadratic/Quadratic/GenusCharacter/Basic.lean` |

Paths in the table are relative to `Mathlib/` and `TauCeti/` respectively. These are source inspections, not Lean elaboration. The QM packet exceeded the connector's decoded-content limit, including at its initial commit; neither that full packet nor the CA packet is certified as freshly inspected. Their exact leaf contracts must be checked before making a supplier-completeness claim. Stage-level overlap and the distinction between a function and a primitive bundled character can be verified without pretending those large files were read.

## Findings

### 1. Positive factorization — confirmed

Item 141 loses the standing hypothesis that the field discriminant is fundamental. Mathlib's definition gives immediate counterexamples: 5 and 5 are fundamental but 25 is not; 8 and 12 are fundamental but 96 is not. Their greatest common divisors are 5 and 4. Thus positivity plus fundamental factors does not imply coprimality or a fundamental product.

Restore the field-discriminant hypothesis in the published Theorem 3 setting (p.964), or require coprime fundamental factors and product greater than one. Retain the allowed factor 1. This is a defect in the extracted standalone statement, not evidence against the published theorem under its standing assumptions.

### 2. Norm supplier — confirmed

The extraction jumps from item 150 to 153; item 153 and E6 still cite 151. The corrected unit-vector estimate cannot obtain a proved normalization conversion merely by mentioning it in prose. Supply an explicit AL.3 adapter and the spectral bound actually needed, with a source or proof for each analytic input.

The paper uses

\[
 \phi(z)=2\sqrt y\sum_{n\ne0}a(n)K_{ir}(2\pi|n|y)e(nx),\qquad a(1)=1.
\]

For the usual even level-one normalization, the constant in the proposed identity can be audited as follows. Unfolding against the uncompleted Eisenstein series gives a factor 8: coefficient 2 squared, and both nonzero signs. The Mellin integral at 1 is \(\pi^2/(4\cosh\pi r)\); the squared-coefficient Dirichlet series has residue \(L(1,\mathrm{sym}^2\phi)/\zeta(2)\), and the Eisenstein residue is \(3/\pi\). Thus the scalar calculation is

\[
 \frac{8}{2\pi}\frac{\pi^2}{4}\frac1{\zeta(2)}\frac{\pi}{3}=2,
 \qquad \|\phi\|^2=\frac{2L(1,\mathrm{sym}^2\phi)}{\cosh(\pi r)}.
\]

The scalar calculation was checked independently. It is not a replacement for the convergence, unfolding and residue theorems just used, nor a proof of an uncited \(r^\epsilon\) bound. State an adequate polynomial upper bound explicitly; keep the analytic supplier obligations visible.

### 3. Genus-character ownership — confirmed, with narrower scope

DIT's classical form character (p.978; items 101–102) overlaps the classical restriction of BEY21/11, whose statement was read directly. The BEY object also includes local trace-zero-matrix and Hilbert-symbol data: that additional comparison is not the same definition and must not disappear in a merge.

Choose one owner for the integral binary-form character and its invariance, with distinct arrows to the ideal-class and local-matrix presentations. GN.2 is a coherent proposed owner. Contrary to the red team's acceptance argument, the BEY extraction at this snapshot is explicitly partial and says its routes are provisional. An earlier merged review does not prove acceptance of those mathematical routes. The form-character parity law can be shared at the common owner too.

### 4. Upstream Fuchsian work — confirmed

FuchsianOrbifolds Layer 2.1 plans polygon Gauss–Bonnet, 2.6 triangle signatures, 4.5 cofinite signature and area, and 6.1 the modular signature. Item 17's area and the cofinite portions of 22–23 must import that work. `FixedDetMatrices.lean` also already proves `SL2Z_generators`.

Separate the implemented SL2 generation theorem, the quotient-to-PSL comparison and the planned signature. Part II should begin with second-kind groups, Nielsen cores and the geodesic-boundary extension, not reconstruct the cofinite case. Do not assign two implementation statuses to one unsplit aggregate.

### 5. Primitive analytic objects and the Laplacian — confirmed, remedy corrected

The QM stage descriptions already identify the Bessel/Kloosterman/weight-Laplacian programme. Reconcile AS/ES/QM ownership rather than creating competing primitive definitions. A special-function definition does not automatically supply a Liouville-form ODE theorem with its domains and branch conventions; preserve that comparison when necessary. Exact QM leaf completeness remains subject to the access qualification above.

There is a concrete error in the red team's proposed half-weight adapter. Put

\[
 \Delta^{\rm hol}_k=-y^2(\partial_x^2+\partial_y^2)
       +iky(\partial_x+i\partial_y),\quad
 \Delta^{\rm unit}_k=-y^2(\partial_x^2+\partial_y^2)+iky\partial_x.
\]

Direct differentiation gives

\[
 y^{k/2}\Delta^{\rm hol}_k y^{-k/2}
       =\Delta^{\rm unit}_k+\frac{k(k-2)}4.
\]

Consequently the unitary operator printed on p.965 is

\[
 \boxed{\Delta^{\rm unit}_{1/2}
 =y^{1/4}\Delta^{\rm hol}_{1/2}y^{-1/4}+3/16.}
\]

Omitting the scalar changes eigenvalues. The symbolic residual of the general formula was zero in the independent check.

### 6. Errata identity collisions — confirmed, collector fix required

The standalone file itself identifies E12 and E13 as extraction E15 and E16; its E14 has the same mixed-index locator as extraction E21. Reusing E12–E14 for different prerequisite findings is not a stable issue-identity scheme. E5/E6/E11 also have differing classifications or verdicts.

`errata.py:collect` appends findings from extraction, packet and errata files. It does not implement `sameAs` or deduplicate equal IDs. Renaming and rerunning alone therefore cannot solve the collision. Define supported canonical records or aliases, then regenerate, keeping the originating file and the historical reviewer judgments. Adjudicate differences explicitly. In particular, a false unnumbered assertion may affect a stated result even when it is unused downstream; “it is a remark” does not force “affects nothing”. This review is not a fresh adjudication of all 34 source findings, and does not claim to have rerun the complete generated register.

### 7. Version metadata — confirmed

The standalone ledger lacks `sourceVersions` despite stated-result findings. `check_errata.py:versions_checked` explicitly rejects that combination. Convert the actual reading provenance into the prescribed metadata, with accurate document kind and reading attribution, and make the extraction consistent.

Do not copy a hash as though the repairing worker had downloaded and verified those bytes. The existing workers' recorded hashes can be preserved as their historical evidence. This verifier inspected the published images but did not freshly hash either version or collate the preprint.

### 8. Blanket planned-status change — rejected

The suggested owners are sensible; the proposed wholesale status change is not established at the existing row granularity. Item 53 is explicitly genus-by-genus, includes the genus mass identities, and cites the generalization of Duke's result. GN.4's broad Duke-type direction and Binyamini's CM-point row do not by themselves identify that whole contract.

Similarly item 57 specifies the classical primitive-pair factor 1/2 and the Laplacian eigen-equation; item 60 specifies completed-series residues exactly \(-1/2,+1/2\). AS supplies general adelic Eisenstein theory; AL.2 supplies standard automorphic L-functions. Those suppliers require normalization and classical/adelic comparisons before they discharge these full aggregates.

Add explicit related-planned imports and split the general supplied results from residual adapters. Do not change all four statuses and counts simply from thematic ownership. This rejects the finding's blanket conclusion, not reuse of GN/AS/AL or a later properly scoped planned-status correction.

### 9. Arithmetic baseline — confirmed

The pinned `toClassGroup_ker`, `mkPrincipal_sq`, `mkPrincipal_eq_one_or_eq_mkPrincipal_gen` and `card_ker_toClassGroup_le_two` were inspected. They supply the kernel/principal-class and order-two inputs that item 4's empty library list hides. Its final identification with the chosen \(J\) is a corollary/presentation comparison, not a new class-group construction.

Mathlib's `Units.rank`, `fundSystem` and `exist_unique_eq_mul_prod` likewise supply the unit theorem. They do not, without further sign and embedding arguments, choose the least totally positive \(\epsilon_D>1\) or establish its exact Pell expression. Retain that residual scope in item 6.

### 10. Stabilizers and fundamental domain — confirmed

The pinned stabilizer statements give PSL orders 2 at \(i\), 3 at \(\rho\), and 1 off their orbits. The orbit file provides closed-domain representatives, `orbit_mk_injOn_fd_left`, and the isolated \(i\) orbit. These are useful existing suppliers, not a complete CM construction.

Keep the boundary set-equality and representative-coverage argument, including adding \(i\) back, and the comparison from fundamental discriminant to elliptic orbit. In particular the classification by discriminant does not follow solely from a theorem classifying arbitrary point stabilizers. Generation is covered by finding 4.

### 11. Hecke carrier — confirmed

The pinned `heckeSlashSum`, its invariance theorem and its composition theorem operate on functions, not only holomorphic modular forms. Their integer-weight interface includes weight zero and should be cited.

The actual carrier is linear in a Hecke-ring element. Specify which combination encodes all determinant-\(m\) cosets and why the normalization is \(m^{-1/2}\). For square/composite \(m\), do not silently replace the full operator by one diagonal double coset. The smooth/cuspidal, Laplacian, Hilbert-space self-adjointness and normalized eigenvalue statements remain to be supplied.

### 12. Cross-ratio citation — confirmed

The full item 14 was compared with the pinned `UpperHalfPlane.dist_eq`. The latter states only the arsinh formula; the extracted statement additionally asserts the projective-endpoint cross-ratio comparison. Split the imported metric from that adapter. Endpoint order, infinity and coincident points need explicit treatment. This is a bounded declaration-level mismatch, not a claimed exhaustive proof that no equivalent theorem exists anywhere in Mathlib.

### 13. Primitive Dirichlet-character adapter — confirmed

At its pin `genusCharFun` is a function \(\mathbb Z\to\mathbb Z\), defined as a finite product. Multiplicativity alone is not the bundled primitive complex Dirichlet character required by the completed-L-function consumer. Supply periodicity, the zero-on-nonunits convention, bundling at level \(|d|\), scalar extension to \(\mathbb C\), and conductor/primitivity, including \(d=1\).

Correct two red-team locators: the completed functional-equation adapter is **155**, not 150; Burgess is **147**, not 144. Reuse the CA.1 character owner, checking its exact leaf contract before claiming primitivity is already supplied. No full CA packet or compiled consumer check is asserted here.

### 14. Dangling references — confirmed; baseline-loss claim rejected

The surviving item 153/E6 and special-function notes still refer to removed numbers or ranges. Stable supplier references are needed. But the assertion that the declarations themselves all vanished is too strong: `baseline.declarations` still records the hypergeometric, beta/Gamma, dominated differentiation, finite-dimensional span, Vitali and theta-inversion statements.

Repair pointers to existing records or surviving items. Restore genuinely missing suppliers such as finding 2's normalization theorem; do not recreate already-recorded library mathematics as missing theory. The source-issue prose may preserve historical references if those references are explicitly resolved rather than left dangling.

### 15. Numerical acceptance examples — confirmed, not exact decimal theorems

The published p.967 table and four examples were inspected. Independently recomputing the products from rounded Table 2 inputs gives:

| Specialization | Recomputed product |
| --- | ---: |
| \(12^{7/4}\sqrt\pi\,b(1)b(12)\) | \(-1,940,297,469.27968959\) |
| \(12^{7/4}\sqrt\pi\,b(-3)b(-4)\) | \(10,475,987,652.7854230\) |
| \(18\,3^{3/4}b(1)b(-3)\) | \(2,862,961,916.57826925\) |
| \(12\,4^{3/4}b(1)b(-4)\) | \(4,410,461,480.36439571\) |

Use the exact specialized identities as acceptance contracts and keep these as approximate regression fixtures. The table does not provide certified error intervals, and product recomputation does not independently check the period integrals. The extraction already mentions the calculation in provenance/E3; what is missing is a reusable theorem-linked acceptance contract, not every record of the numerical work.

### 16. Siegel and Burgess routing — confirmed with producer/consumer distinction

The AN.2, AN.3 and AN.4 texts were compared directly. Choose one explicit Siegel \(L(1,\chi)\) supplier, with the source route and ineffectivity visible; AN.2 fits the source direction cited in this finding. A class-number consequence at AN.4 is a consumer, not automatically duplicate theory.

Item 147 is a critical-line L-function estimate. Distinguish its finite character-sum input from the analytic reduction, conductor range and spectral-height dependence. Route those producer and consumer contracts separately and link them. Merely naming AN.3 does not supply a proved subconvexity theorem.

## Validation and repair boundary

The unmodified `check_redteam.py` was copied through the connector; its local Git blob hash was checked as `c736ae33fd46ec11c6e718be27479d9d5a520211`. The prescribed command passed locally against an **ID-only projection** of the input's sixteen finding IDs. This is sufficient for the checker's review branch, which reads only those IDs, and is not represented as a full-repository run. A supplemental check verified exactly sixteen distinct IDs, fifteen confirmations and one rejection. The full-input check belongs to PR intake/CI.

Independent Python/SymPy checks verified the two discriminant counterexamples, the general Laplacian conjugation identity, the Rankin–Selberg scalar arithmetic and the four rounded-data products. With the printed rounded \(r=13.77975135\), the quarter-shift gives 190.131547267826822 and the half-shift 190.381547267826822. These computations are consistency checks, not substitutes for the analytic source proofs.

No Lean file was compiled, no missing theorem is certified implemented, and no full atlas/register rebuild was run. The PR contains only the verdict JSON, this report and the job handoff. It deliberately does not alter the extraction, packet ownership, historical errata judgments or generated data. The repair worker should use the qualified remedies above, not apply the original red-team fix text mechanically.
