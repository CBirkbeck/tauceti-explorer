# REV-RT-PAPER-LUST-STEVENS-20

Verifier: **Codex — codex-5ebb6f**, 2026-09-30 UTC. Issue [#5101](https://github.com/CBirkbeck/tauceti-explorer/issues/5101); base `e5d1eed`.

**All five findings are confirmed.** The corrected sign and published Levi construction should be applied; the existing E5/E6/E7 corrections must reach the exported statements and dependent briefs. Finding 5 concerns injectivity of subgroup/representation labels, not the valid classification of lattice orbits. This is a §17 verification, not a fresh acceptance of the extraction or its entire routing/library audit.

The extraction author was `cc-f805bf`, its reviewer `cc-fb70e5`, and the red-team author `codex-rtOQ9t`. This session did none of those jobs. I read WORKERS and PROTOCOL §17, every finding, the named extraction statements, E5/E6/E7 and their earlier review reasons, and the relevant route instructions. I independently checked the primary passages and calculations below. No full-paper reading or certification of all 158 items is asserted.

## Primary evidence and versions

All three PDFs were freshly retrieved on **2026-09-30 UTC**. Page numbers are one-based physical PDF pages. The first two byte hashes match the extraction and red-team records.

| Source | Selected passages read | SHA-256 |
|---|---|---|
| [Published PLMS paper](https://ueaeprints.uea.ac.uk/id/eprint/74421/7/Published_Version.pdf) | PDF 5–10 (printed 1087–1092): conventions, quotients, maximality and induction; PDF 16–20 (1098–1102): cuspidal multiplicities, Levi and Weyl lift. Rendered PDF 9 and 20. | `bd8295cfd75e81b7c55f1bff08909679ca267c85c724debba23a3dc990624c55` |
| [arXiv v1](https://arxiv.org/pdf/1611.08421v1) | PDF 17–19: superseded rational-block Levi and Weyl display. Rendered PDF 19. | `c1c8bd2f3dce4b2934c9b2172665f3ad7bccea16d751c1301434a97011b2d489` |
| [UEA accepted manuscript](https://ueaeprints.uea.ac.uk/74421/1/LustStevensDepthZeroFinal.pdf) | PDF 19: repaired Levi paragraph; PDF 21: sign display, also rendered. This manuscript has 39 pages and is not the published PDF. | `dbb0752cd5e8b0eefa4e531a30c11fea11eb33072a969e2f83fead6d252feebb` |

The bounded correction search covered the exact title with erratum/corrigendum and the DOI with Weyl/symplectic/correction, plus the [arXiv history](https://arxiv.org/abs/1611.08421), [UEA record](https://ueaeprints.uea.ac.uk/id/eprint/74421/) and [publisher result](https://doi.org/10.1112/plms.12340). No separate Weyl-sign correction was found among the inspected results. The DOI open request failed in the browser tool; the search result and public PDFs supplied the evidence. This does not establish that no correction exists elsewhere. The accepted manuscript is an additional checked version: it repairs the Levi but retains the bad sign.

## Finding 1 — confirmed: symplectic Weyl lift

The extraction's `s7-7.6-weyl-representative-action` retains the same paired sign visible in both primary displays. Work in the ordered pair `(e_-,e_+)` with

```text
J = [[0,1],[-1,0]]
W_bad = [[0,-1],[-1,0]]
W_good = [[0,-1],[1,0]].
```

Direct multiplication gives `W_badᵀ J W_bad = -J` and determinant −1. In odd characteristic this fails the symplectic equation. The corrected map sends `e_-` to `e_+` and `e_+` to `epsilon e_-`; it preserves the epsilon-symmetric pairing and has determinant `(-epsilon)^n` on n exchanged pairs. Hence it is symplectic for epsilon = −1 and special orthogonal for epsilon = +1 when n is even.

I read [Mathlib's pinned symplectic carrier](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/SymplecticGroup.lean#L101), with its Fintype/CommRing hypotheses. It uses `A J Aᵀ = J`, and the bad matrix fails that convention too. Both pin HEADs were verified against `082e2d37e8b0463410cdb532e111cd43d5a66174` and `f790474821cf4256814db967cb154e7af3d0c369`.

For the paper's reversed lower-block basis, the corrected lift has blocks `[[0,epsilon w_n],[w_n,0]]`. Conjugating `diag(g,h,mu(h) w_n g^-T w_n)` gives the same induced pair `(mu(h)g^-T,h)`. The reversal matrices are essential in this calculation. Correct the lift, add a version-specific source issue and update the finite-group construction brief; this calculation gives no reason by itself to change the later parameter table.

## Finding 2 — confirmed: primary blocks are not the Levi

The named `s7-7.3-eigenspace-levi` still uses the preprint construction. The later version replaces it with the minimal Frobenius-stable geometric Levi containing the centralizer; its following general-linear factors use twisted Frobenius. The rational primary-space stabilizer is too large.

Independently, over F_3 take `P=X⁴+X³+X²+X+1`. No monic polynomial of degree one or two divides P, and its roots are order-five elements with inverse given by ninth power. For `E=F_81`, multiplication by a root zeta preserves

```text
Q(x) = Tr_(F_9/F_3)(x*x^9).
```

The form is nondegenerate and the multiplication matrix has determinant one. Adding a nondegenerate identity line produces an SO_5 element of characteristic polynomial `(X−1)P`. The five geometric eigenvalues are distinct. Its centralizer is a rank-two torus, whereas the connected stabilizer of the rational four-dimensional block and line contains SO_4, of dimension six. The proper geometric Levis of SO_5 have dimensions four, four or two, so that stabilizer is not a Levi. The exponents `a_P=1,m_P=1`, `a_+=1,m_+=0`, `a_-=0` meet the cited cuspidal-series conditions; the example is inside the item's scope.

Use the published construction and comparison interface, and classify the preprint defect as already repaired in print. Do not accidentally require a Frobenius-stable parabolic: an elliptic torus can be a Frobenius-stable geometric Levi without being the Levi of a rational parabolic.

## Finding 3 — confirmed: ramified quotient correction remains in a note

The exported `s2-reductive-quotient-J` equation universally imposes the residue determinant condition. Its own note and E5 already reject that condition in the ramified unitary branch.

For a ramified quadratic extension in odd residue characteristic, take the unitary line with `h(e,e)=1` and `L=O_F e`. In the p_F-valued convention, `L#=p_F L`, so the residue spaces are a symmetric line and zero. The norm-one units reduce onto `{1,−1}`; both signs occur. Since the residue extension is trivial, the proposed determinant norm is the identity and excludes −1. Thus the exported quotient would be trivial instead of O_1.

Apply the existing E5 branch: preserve the determinant condition in the trivial/unramified cases, use the full residual product in the ramified case and preserve its connected-component description. The target statement and route-1 construction instructions both need it. This is propagation of an existing source correction, not another erratum.

## Finding 4 — confirmed: anisotropic SO_2 is not an obstruction

The two extraction maximality statements disagree: `s2-parahoric-Jo-properties` excludes every two-dimensional residual special orthogonal factor, while `s2-maximal-parahoric-exceptions` distinguishes the split factor. I visually checked the later ambient exception `(N,N^an) ≠ (1,0)`; its missing inequality in plain PDF extraction is not a source correction.

An explicit independent local example is the anisotropic Q_3 form

```text
Q(x,y,z,w)=x²−2y²−3z²+6w².
```

For nonzero `(x,y)`, the valuation of `x²−2y²` is even: after removing their minimum valuation its residual norm is nonzero. The valuation of `3(z²−2w²)` is odd. Their equality is impossible unless both pairs vanish, proving anisotropy. On `O_3⁴`, the p-valued dual is `3O_3² ⊕ O_3²`. Its two residual binary forms are `x²−2y²` and `−z²+2w²`, both anisotropic over F_3. Thus the unique maximal parahoric has two anisotropic two-dimensional SO factors, contradicting the broad exclusion.

Replace the first clause with the already extracted split SO(1,1) criterion and ambient-dimension exception, retaining its case list and E6. The normalizer problem is separate and is addressed by finding 5.

## Finding 5 — confirmed, with a precise label boundary

For split SO(1,1), identify G with F^times acting as `diag(t,t^-1)`. The lattices

```text
L(0,0)=Oe_- ⊕ Oe_+
L(0,1)=Oe_- ⊕ pi Oe_+
```

are almost self-dual, with p-valued duals `pi L(0,0)` and `L(0,1)`. Both have stabilizer O^times. The action changes lattice exponents `(a,b)` by `(v(t),−v(t))`, preserving `a+b`; these two lattices are not conjugate. Subgroups therefore do not determine an injective standard lattice label. This does **not** disprove a unique standard representative for each lattice orbit; preserve that valid assertion separately.

The full normalizer of O^times is F^times, which is noncompact. Compact induction from O^times has independent valuation-indexed cosets and infinite dimension; it cannot equal a one-dimensional depth-zero character. The claimed compact normalizer and compact-induction classification therefore need the split SO(1,1) exclusion. Its propagation must also reach `s3-depth-zero-uniqueness` and the dependent local-data statements, which currently claim that `(N_1,N_2)` is determined by the representation. A separate branch may instead use characters of F^times and its full normalizer. Reuse E7, and align route 1.

## Checks and limits

An independent exact-arithmetic script checked both rank-one matrix conventions; all 30 paired lifts with `1≤n≤N≤5` and both signs; an inverse-transpose block example with nontrivial g and similitude factor; all monic degree-one/two divisors of P; the trace form on all 81 field vectors, its Gram determinant and multiplication isometry; and a rank-two Lie centralizer by linear equations over F_3. It also checked the anisotropic residual norm and lattice-dual/exponent invariants. These calculations support the counterexamples and fixes; they are not Lean proofs of the representation theory or Bruhat–Tits classification.

The review JSON has exactly one verdict for each of the five finding IDs. The red-team checker, two-file intake validation and whitespace check pass. Only the verification JSON and this report are changed. No Lean deliverable, compilation, Lake project, cache download or language server is involved.

The follow-up fix must correct the extraction statements and briefs, retain the existing provenance for E5/E6/E7 and record the new sign issue and already-published Levi repair distinctly. No upstream roadmap, parameter-table theorem or unrelated extraction item is recertified by this verification.
