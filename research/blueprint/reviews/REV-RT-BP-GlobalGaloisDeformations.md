# Independent verification: Global Galois Deformations

**All three findings confirmed:** /1 and /2 high, /3 medium. Codex, session `codex-J6LwjP`, 2 October 2026; issue #4445. I did none of the original blueprint, its acceptance review or this red team (`codex-rtOQ9t`). Inspected explorer commit `363633e`. Only the two verification deliverables change.

## /1 — conjugacy signatures: confirmed

The suggested `strict_of_full` and `strictly_conj_of_trace_eq` lack the actual local coefficient-ring hypotheses. A surjection to a field is insufficient. I read their enclosing variables, lift and strict-kernel definitions, the packet's corresponding nodes and the source coefficient categories.

The integral matrices C=(0,-1;1,-1) and S=(0,1;1,0) generate S3. Conjugate by a=(2,5;5,12), determinant -1 and reduction 2I mod5. Traces and residual lifts agree; I,C,S,CS have flattened determinant -3, so the residual matrix span is all M2(F5). Commutation with S forces an integral centralizer matrix (x,y;y,x); commutation with C forces y=0. Its invertible scalars are therefore only ±I. Any conjugator is ±a, reducing to 2I or 3I, never I. This directly contradicts both conclusions.

**Repair:** use the existing R03.1 coefficient categories and residue-field identifications, with the hypotheses of each source theorem. The strict-normalization lemma and Carayol trace theorem need separately scoped signatures. Preserve the packet's local-category statements; include the integral negative example and a local Artinian normalization example. Over F5[ε]/ε², the scalar 2 is a unit, so normalizing 2I+εS does reduce to I.

## /2 — framed tangent complex: confirmed

The packet's ordinary trace-zero global complex cannot support its framing calculation. The source uses full endomorphisms in global degree zero and at framed local degree zero; the positive degrees retain trace-zero cochains. The required object is a shifted mapping fibre, with differential `(dφ, res φ − dψ)` and explicit local-condition quotients. I checked the displayed terms visually as well as in extracted text.

For rank one, fixed trivial determinant forces every representation lift to be trivial. Two scalar framings still give `(1+m)²/diag(1+m)`, identified by their ratio with `1+m`. Infinitesimally this is k²/diag(k), dimension one. Ordinary ad0 is zero and incorrectly gives zero; a patch keeping only local scalar terms incorrectly gives two. Enumerating F3 frame quotients for zero through four frames gives dimensions 0,0,1,2,3. With no frames the modified complex instead retains H0=k, so the empty-framing convention must stay separate.

**Repair:** specify every degree and the shifted differential in the node and its supplier request. Tighten R02.5's interface while coordinating D8's deformation comparison with the existing SelmerIwasawaCohomology L2 mapping-fibre owner. Do not reconstruct generic cohomology or confuse the dual ordinary Selmer kernel with the framed complex. The packet already has `#T−1`; propagate its existing E3 correction to the reader, which still prints `#T`. Add the zero-, one- and two-framing tests. This does not file a new error in the source.

## /3 — KW detecting elements: confirmed

The proposed common proof asserts whole-adjoint irreducibility under either image hypothesis. The standard S3 representation mod5 contradicts that assertion while satisfying KW's cyclotomic irreducibility condition. Its residual span is full, but J=C−C⁻¹=(1,-2;2,-1) generates a proper trace-zero invariant line, fixed by C and negated by S. A Tate twist preserves the line.

For its arithmetic realization, X³−2 is Eisenstein and has nonsquare discriminant −108. The splitting field has S3 group and quadratic subfield Q(√−3). Its intersection with Q(ζ5) is trivial because the latter has quadratic subfield Q(√5). Thus the cyclotomic restriction has the same absolutely irreducible image; complex conjugation is a determinant −1 transposition. No stronger image condition can be silently imposed on this KW variant.

The correct Taylor citation is *On the meromorphic continuation of degree two L-functions*, Lemma 2.5, printed pp.749–750. KW's reference [59] is that paper; *Remarks on a conjecture of Fontaine and Mazur* is [58]. Taylor detects constituents separately and treats the induced/dihedral alternatives.

**Repair:** separate Gee's strong-image argument from KW's constituent-detection argument, importing the latter through R01.4 with its actual hypotheses. R02.6 still owns the distinct H1-vanishing input. Retain the shared Chebotarev selector. Taylor's `l>3` scope must remain visible; the KW p3 branch needs its own sourced justification. The counterexample refutes the common spanning argument, not the KW auxiliary-prime theorem.

## Direct evidence and validation

| Public source | Passage freshly read on 2 October 2026 |
| --- | --- |
| [Gee, arXiv v2](https://arxiv.org/pdf/2202.05818v2) | pp.12–13 coefficient categories/conjugacy; pp.15–18 framing and complex, with p.16 image; pp.38–39 prime detection |
| [Kisin, Lecture 1](https://people.math.harvard.edu/~kisin/notes/notes.pdf) | §1.1.1 p.1 and Theorem 1.4.1 with proof pp.3–4, through the public PDF reader |
| [KW II, author final](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf) | Lemmas 5.2–5.3 pp.47–48 and bibliography [58]/[59] p.97 |
| [Taylor, published](https://ftp.gwdg.de/pub/misc/EMIS/journals/DMJDMV/vol-coates/taylor.pdf) | Lemma 2.5 and proof, printed pp.749–750, physical pp.21–22 |
| [Pinned Mathlib local-ring predicate](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/LocalRing/Defs.lean) | `IsLocalRing`, read directly |
| [Pinned Mathlib GL](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean) | matrix units, scalar embedding and ring-map functor, read directly |

The downloaded Gee and KW files match their packet SHA-256 values. Taylor matches `b789abe91b16eb592acf88c639a3af7b7c3192ad81b74a6d21ea10593df9cc9a`. Kisin was read through the PDF reader; no downloaded-byte hash is claimed. These are selected passages; auxiliary proofs and other sources are not recertified.

The exact Mathlib and Tau Ceti checkout pins were verified. The unchanged 66-node packet passes its checker with the pinned declaration index (0 errors, 0 warnings); this indexed name check is not a new direct-statement audit of all sixteen other citations. The red-team result and review pass `check_redteam.py`; intake and whitespace checks pass. Exact arithmetic independently verifies six group elements, equal traces/reductions, residual span, all 625 mod5 centralizers, the invariant adjoint line and the infinitesimal frame quotients.

No Lean file changed or compiled, and no build/cache/LSP was started. Existing source E3, the stage-coarsening gap and earlier area ownership findings remain distinct from these three confirmed corrections.
