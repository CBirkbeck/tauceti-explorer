# BP-HabiroNahmSeries--HB.4 — issue #6507

Agent: Codex, session codex-kvLFkB. This is one complete target-level planning pass, scoped only to HabiroNahmSeries:HB.4. The parent packet is unchanged. No mathematics is claimed implemented.

## Delivered

The continuation has **13 nodes: 7 theorems, 5 comparisons and 1 construction**, with **7 API items, 4 discriminating unit tests, 2 added planets and 13 pinned baseline declarations**. Together with the parent's four planets, HB.4 has six. Packet status is **complete**; HB.4 coverage is **planned**, with **3 gaps and 1 owner request**. This is not a closed layer or a partial checkpoint.

The reader and packet agree on the upper-half-plane rational exponent convention, positive Hessian determinant branch, cyclic roots defined through factorwise logarithms, the corrected Dedekind phase, negative B term, eta correction and Gaussian factor. The new proof route supplies a global finite-product modulus estimate, a Gaussian tail bound, a fixed expanding window, a compact guarded product remainder and exact Poisson covolumes. Congruence splitting uses absolute differences and retains cancellation when G or Φ vanishes. These estimates supply the analytic component independently of arithmetic descent.

The coherent field construction uses y_i=z_i^(1/d), η_i=z_i^(1/(dm)), θ_i=η_i^d and E=Q(y,ζ). Actual E-automorphisms act on η, not on arbitrary rational powers of θ. The Gauss-value extension is separate. The rational normalization problem remains explicit: A=(1), B=1/4 and m=1 give a positive leading coefficient 2^(−1/4), whose square is not in Q(z)=Q. Integer-valued Q with half-integral B also needs care for the displayed normalization; the d=D=1 specialization here requires integral B and even-diagonal integral A.

The general Andrews–Gordon identity is supplied by the existing QM.0/andrews-gordon-identities and QM.0/andrews-gordon-nahm-form. It is not replanned, and the parent's request for that identity is no longer an outstanding input to this part. The positive min-matrix solution has coordinates **1−[sin(π/n)/sin(πj/n)]²**, j=2,…,r+1, in that order.

## Exact follow-up inputs

1. Prove the coefficientwise identity σ(C(θ)⁻¹T(η,ε)^m)=C(θ)⁻¹T(η,ε)^m for every actual E-automorphism of H_rad=E(η), with σ(η_i)=ζ^{s_i}η_i and σ(θ_i)=ζ^{ds_i}θ_i. The proof must transform the complete corrected exponential integrand under formal Gaussian translation and handle congruence wraparound. Reindexing only the constant prefactor does not prove the all-orders statement. GZ's published proof establishes the analytic expansion but does not supply this arithmetic identity.
2. Reconcile the rational-data constant Kummer class and eigenspace statement with the coherent Bloch class over Q(y) and the auxiliary Gauss-value field K=Q(y,ζ,ζ_D). Prove the necessary scalar/representative compatibility before using the near-unit corollary. Preserve Φ₀≠0 and the supplier's gcd(m,w_K)=1 condition where applicable.
3. Supply the exact **Polylogarithms:P.1** request in the packet: real Rogers values on P¹(R) modulo π²/2, the CGZ normalization and integral relation descent, and the trigonometric identity giving Λ=(n−3)π²/(6n). Classical Li and its distribution nodes already exist.

These are refinement inputs to a finished target-level pass. Resume at the named gap nodes; do not duplicate the accepted parent definitions or the q-series, cyclic-dilogarithm, formal Gaussian or regulator owners.

## RT-AREA-topology/11

HB.4 supplies Euler–Maclaurin/saddle estimates to ArithmeticQuantumTopology:QT.6; HB.8 supplies formal Gaussian theory. QT.6 owns topological identifications, NZ/DG invariance, Faddeev integrands, state-integral contours and 2–3 invariance. HB.4 has no dependency on QT.6. HB.10 knot matrices are formal data until a QT.6 identification is imported. The parent already records this supplier interface. This continuation states it in the reader and radial theorem's uses; consumer/source files outside the four allowed deliverables were not edited.

## Sources and collation

Read GZ's published Ramanujan Journal article, its named arXiv v1, CGZ's published Annales ENS paper and arXiv v3, Vlasenko–Zwegers §2 in the public preprint, and Zagier's public chapter II.1A, II.2C and II.3C. The VZ publisher PDF returned HTTP 403; no claim is made to have read that version of record. URLs, access dates, sections and SHA-256 hashes are retained in sources/sourceVersions.

Six sourceIssues collate the parent GZ/CGZ findings against the journal texts and add the incorrect claim of exponential Fourier decay for general smooth rapidly decreasing functions. The journal Proposition 2.2 includes exp ψ, but its definition (14) still lacks it. The corrected analytic formula, coefficient fields and source findings require independent mathematical review. Searches of the authors' publication pages and arXiv listings did not locate a separate correction to the relevant displayed formulas.

The reviewed HB.4 audit was read. Mathlib declarations were read at 082e2d37e8b0463410cdb532e111cd43d5a66174; Tau Ceti was searched at f790474821cf4256814db967cb154e7af3d0c369. A pinned declaration index with matching BASELINE metadata was also used. Upstream density examples read completely: ArithmeticDirichletSeries and Completed/ContourIntegration; the ModularForms introductory/lower-layer discussion was additional guidance.

## Verification

- `python3 scripts/check_blueprint.py research/blueprint/packets/HabiroNahmSeries--HB.4.json`: zero errors and zero warnings. Also checked with the matching pinned declaration index: zero errors and zero warnings.
- `lean-check research/blueprint/suggested/HabiroNahmSeries--HB.4.lean`: **elaborated successfully, exit 0, only declaration-uses-sorry warnings**, in the shared build at pinned Mathlib. No Tau Ceti import is needed for these signatures. Available memory exceeded 20 GB. No language server, new Lake project or library build was started.
- All seven API names and four test names occur in both the reader and suggested file; excerpts meet the 300-character limit; new node ids do not collide with parent ids; combined planets total six. No implementation status was changed from unchecked.
- Direct finite Nahm-sum numerical checks in scratch confirmed a₀=0.8506508083520401 and a₁/a₀→−1/60 at A=(2), B=0, m=1. The error divided by ε² stays near 0.00011814 for ε=0.1,0.05,0.02,0.01. Root limits at 1/3 and 2/3 are conjugate, 0.402733397013623±0.337933444896903i. The 1/5 constant matches exp(2πi·0.09). These are double-precision regression evidence, not proofs.
- `git diff --check`: clean. Only the four allowed deliverables are submitted.

The suggested file includes concrete field, product, modulus, domination, Poisson, radial-existence and formal-root-recursion signatures. The exact higher-coefficient identification and arithmetic interfaces whose parent types are unavailable are documented in comments, without empty substitute objects. A follow-up with actual supplier modules must replace these comments with their full signatures. The file is a non-exhaustive prototype, as required by the protocol.
