# PKG-EulerSystemsCyclotomicMainConjecture~2

Refs #11031. Claude (Opus 5.5), session `claude-bibFuI`, 19 October 2026.

This is a complete revision, not a checkpoint. The previous package
(PKG-EulerSystemsCyclotomicMainConjecture) was sent back by its review
(REV-PKG-EulerSystemsCyclotomicMainConjecture, `needs_changes`) for four
missing proof routes. This revision supplies a complete argument for each
one, with sources read in this run, and brings `Suggested.lean` in line with
the 2026-10-19 rule on examples. Only the four deliverables change. The
accepted packet, the reader, the suggested input, other roadmaps and the
previous review's `review.json` are untouched.

## The four obligations and how each is closed

1. **Uniform circular-unit comparison (README §3.3; consumed by §3.4).**
   The old route needed a descent of global units E∞→E_n with bounded
   errors, which was not available. The new §3.3 avoids global-unit descent
   altogether. For each nontrivial character ψ of Δ=Gal(L/ℚ), p odd and
   p∤[L:ℚ], it compares U∞/C∞ and the p-ramified module Z∞ with their finite
   layers. In outline:
   - The control for Z∞ is exact.
   - The control for U∞/C∞ is exact when ψ(p)≠1. When ψ(p)=1 it holds
     with ν_n=ω_n/T in place of ω_n and an error a_ψ+ℓ(U/TY) that does not
     depend on n. The argument uses Hilbert 90 and local reciprocity for the
     multiplicative groups, and the valuation sequence of Rubin
     Proposition III.2.6(ii).
   - The finite-level class-field-theory identity
     ℓ(E_n/C_n)−ℓ(A_n)=ℓ(U_n/C_n)−ℓ(𝔛_n) connects the two sides.
   - Sinnott's tower theorem makes the circular-unit index equal to
     h·2^{[k_n:ℚ]}·c⁺ with c⁺ independent of n for large n (Sinnott 1980,
     Introduction p. 182, Theorem 6.1 p. 226, §7 pp. 232–233).
   - The ψ-components of Sinnott's circular units are computed exactly:
     O′[Γ/Γ_n]ξ_{n,ψ}+O′ξ_{0,ψ}, where the second summand is redundant iff
     ψ(p)≠1.
   - With the four-term sequence, this gives equal totals of μ and λ for
     E/C and A. No class-side control and no analytic nonvanishing input is
     used. §3.4 now applies §3.3 to the field cut out by χ, with divisibility
     for every ψ (§2.4 has no hypothesis on ψ(p)).
2. **Odd-prime split case of Greither Theorem 4.1 (README §4.21).**
   Greither p. 482 says that his restriction to p=2 is only for simplicity.
   §4.21 now runs §§4.15–4.19 at odd p and verifies each change:
   - Corollary 4.3 and Lemma 4.4 become trivial, because 2 is a unit.
   - In Proposition 4.7, the kernel of log_p on ℚ_p^× is V_p=p^ℤ×μ_{p−1},
     derived from the norm group of the local cyclotomic ℤ_p-extension.
   - λ lands in pM, because log_p(ℤ_p^×)=pℤ_p.
   - The Gauss-sum element must be g^m, which is independent of the
     additive character, with g_F=N_{D/F}(g^m).
   - The odd-p (G1) and (G2) come from Stickelberger and the
     Ferrero–Greenberg formula.
   - The factors p and m cancel in Theorem 4.6.

   The χ(p)≠1 case is §4.20 steps 3–5 with p for 2. Solomon (Ann. Inst.
   Fourier 40 (1990), Theorem II.1 p. 472, proof pp. 481–491) is cited for
   the odd-prime statement with equality and for the odd-prime Gauss-sum
   element, its factorisation and logarithm formula (pp. 485–486, (21),
   (22), Lemma III.1).
3. **Exceptional nonvanishing (README §4.18; used by §§4.19–4.22 and §4.21).**
   λ_χ(g_F)≠0 is now proved inside the roadmap. μ_χ(g_F)≠0 by (G1), so the
   χ-idempotent e·g_F≠0 in F^×⊗ℚ̄. Baker–Brumer
   (`IntegralIwasawaTheory:L4/baker-brumer-algebraic-numbers`, parts (a) and
   (b)) shows that the ℚ̄-linear logarithm has kernel ℚ̄·2 on the span of the
   conjugates. Applying e again gives e·g_F=0, a contradiction. Hence
   G′_2(0,χ̌)≠0. The same argument works with log_p at odd p. The roadmap no
   longer requests `DirichletPadicLFunctions:L3/rjw2-fg-nonvanishing`, whose
   own packet still records its source-decomposition gap; that supplier gap
   no longer blocks this roadmap.
4. **Pure cyclotomic characters of Greither's Coleman image (README §4.7).**
   For m=cond(ρ|Δ)=1, step 7 replaces the non-unit series f₀=X by the
   smoothed units c_b=(1−ζ^b)/(1−ζ), with b∈μ_{p−1} and ρ(b)≠1. The steps
   are:
   - V_ρ(C∞)=V_ρ(Λc_b) by Lemma 2.3 and the distribution relations, since
     ρ is trivial on Δ.
   - αψ(c_b)=(b[b]−1)(1−φ)δ(X), by the chain rule D([a]g)=a·[a]D(g)
     (Greither p. 461).
   - The pole of (1−φ)δ(X) cancels on the χ⁻¹-part, because
     Σ_{b′∈μ_{p−1}}ρ⁻¹(b′)=0.
   - Greither's evaluation identity holds at every point 1−ζ_{p^ν′} with
     ν′≥2.
   - b[b]−1 acts on the χ⁻¹-part as the unit ρ(b)−1.

   No comparison with the ColemanPowerSeries L4 normalisation is needed any
   more, so that request and the matching DirichletPadicLFunctions L2 request
   were removed from the supplier contracts. L2 is asked only to include the
   characters ρ that are trivial on Gal(F/ℚ).

The previous review also recorded the IntegralIwasawaTheory general-conductor
correction as an inherited limitation. §5.1 and the L0 contract now cite
Sinnott 1980 Theorem 4.1 (p. 207) and Proposition 5.1 (p. 211) directly. For
odd p and real L with p∤[L:ℚ], these give v_p[E_L:C_L]=v_p(h_L), and §3.3(a)
identifies the components. The packet node
`IntegralIwasawaTheory:L0/general-conductor-index` still says the correction
is unresolved. Its owner can close it with these two citations. The dyadic
reflection input to arithmetic μ=0 is unchanged and remains a supplier matter.

## Other changes

- **Supplier contracts.** These were rewritten:
  - ColemanPowerSeries:L4, with the m=1 comparison removed.
  - DirichletPadicLFunctions:L2, adding the characters trivial on
    Gal(F/ℚ), and L3, covering all p with Ferrero–Greenberg and
    Gross–Koblitz at every prime and no nonvanishing request.
  - IntegralIwasawaTheory:L0, now Sinnott's three published statements.
  - IntegralIwasawaTheory:L2, with the odd-p lattice request removed.
  - A new IntegralIwasawaTheory:L4 bullet for Leopoldt, Ferrero–Washington
    and Baker–Brumer.
  - ClassFieldTheory Layer 12, extended to the finite unit/p-ramified
    sequence for every totally real abelian field and to local reciprocity
    in the totally ramified cyclotomic tower.

  Mathlib `groupCohomology.exists_div_of_norm_eq_one` (Hilbert 90, read at
  the pin) was added to the Mathlib list.
- **References.** SINNOTT-1980 and SOLOMON-1990 were added, with their page
  offsets (Sinnott: journal page = PDF page + 179; Solomon: journal page =
  PDF page + 465).
- **Suggested.lean.** It had ten examples proved by `sorry`. These are
  forbidden by the restated rule of 2026-10-19 (no admitted examples; at
  most two proved examples per kept definition).
  - It now has seven proved examples: two for `chiComponent` (trivial
    character equals invariants; the ZMod 2 non-example), two for `chiSum`
    (the unnormalised trivial sum; the sign sum in the regular
    representation of C₂), and the three recorded negative controls (the
    RJW ratio identity with ζ≠0, now proved; the ζ=0 counterexample; and
    ¬IsUnit(1−(−1))).
  - The removed admitted examples were numerical tests of library objects,
    such as norms of 1−i and ζ₆−1, the conductor-7 Frobenius exponent and
    the order-4 character. They remain as README Checks in §§0.5–0.7,
    §0.18 and §0.20.
  - The theorem signatures are unchanged. The file has 223 lines, two
    real-bodied definitions and 16 theorems, 15 of them proved by `sorry`.

## Sources read in this run

| Source | Version and hash | Read |
|---|---|---|
| Rubin, *Euler systems* (author draft) | SHA-256 `de47655dc35066fd01f2e76a37076ad03dee62e816130586c7674e520be73d50`, matches packet | III §2, pp. 33–39 printed (Theorem 2.3–Theorem 2.10) |
| Greither, AIF 42 (1992) | SHA-256 `8e4db974556923a9532151657039d50b34028254f13fc2f1541f449bb50623da`, matches packet | pp. 461 (Corollary 2.7), 469–470 (3.1⇒3.2), 482–484 (Theorem 4.1) |
| Sinnott, Invent. Math. 62 (1980), GDZ `PPN356556735_0062`, LOG_0014 | SHA-256 `ca496fb4f381eb97cb51bb25449d69a2f642bdcce6f93f2f0f61b143fda19637` | pp. 181–183, 201–203, 205–209, 210–211, 226–229, 232–233 (page images) |
| Solomon, AIF 40 (1990), Numdam `AIF_1990__40_3_467_0` | SHA-256 `c207989da1f0efd8bc4a8344a9880adbf5cebf3d3b217a0923642c9d8cdaed64` | pp. 467–492 (text layer; pp. 485–486 on page images) |
| Gross, J. Fac. Sci. Tokyo 28 (1981) | SHA-256 `f522f508ca1fce6c927a17d26a4b30fd9aa48ec0fec6f716fe6e7d29f0ca1e77`, matches packet (download succeeded this run) | not needed for the new arguments |

All new text is in my own words, with locators. The cleared-library INDEX
was read; none of its books is relevant, and no uncleared copy of
Washington, Lang or Mazur–Wiles was used. Sinnott (GDZ) and Solomon (Numdam)
are freely available scans.

## Adversarial pass on the changed statements

| Statement | Instances tried | Outcome |
|---|---|---|
| §3.3(a) components | ψ(p)≠1 versus ψ(p)=1; p∣f_ψ (tame at p); extra primes q∤f_ψ; q²∣m with q∥f_ψ | Redundancy of O′ξ_{0,ψ} exactly when 1−ψ⁻¹(p) is a unit; extra primes give Euler-factor multiples; wild averaging needs ψ trivial on the higher unit group, true when q^b∤f_ψ. |
| §3.3(b) ψ(p)=1 | n=0, where the image of C∞ in U_0 is 0 | Using ω_n with the image of the limit would give U_0^ψ≅O′, which is infinite; Sinnott's extra ξ_{0,ψ} and ν_n are both needed. Recorded as a Check. |
| §3.3 error terms | errors growing like ℓ(O′[T]/(T²,ω_n)) | Such errors would change λ; all errors used are constants. Recorded as a Check. |
| §3.3(d) | ψ with ψ(p)=1 inside the total for χ with χ(p)≠1 | §2.4 holds for all ψ, so the totals argument covers them (Check added to §3.4). |
| §4.7 step 7 | F=ℚ, p=5, ρ=ω²; ρ=1 | b of order 4 gives ρ(b)−1=−2, a unit, and the polar sum is 0; for ρ=1 the polar sum is p−1≠0 (excluded). |
| §4.7 step 7 | evaluation at ν′=1 | x^p=1 there, so Lemma 2.15(b) and φδ(X) have poles; only ν′≥2 is used. |
| §4.18 step 5 | u=2; u=±1 | μ_χ and λ_χ both vanish; the argument requires e·u≠0, supplied by (G1) for g_F. |
| §4.21 | odd p versus 2 | Kernel of log is p^ℤ×μ_{p−1}, not {±1}×2^ℤ; image of ℤ_p^× is pℤ_p, not 4ℤ_2; g^m, not g, lies in D. |
| §4.21 χ(p)≠1 | χ(p) of p-power order | 1−χ(p) is then a nonunit and the kernel bound Nχ(1−χ(p)) is needed; cancels against Nχ(1−χ⁻¹(p)). |
| Suggested examples | ZMod 2 with χ(δ)=−1; C₂ sign character | Proved; they separate the eigenspace from a scalar-injective setting and the unnormalised sum from a projection. |

## Validation

- `lean-check` on the package `Suggested.lean`: exit 0, no errors; the only
  warnings are 15 `declaration uses sorry`, at the pinned build (Mathlib 082e2d3,
  Tau Ceti f790474). Memory was above 20 GB; nothing is left running.
- `python3 scripts/check_sorry_data.py` on `Suggested.lean`: exit 0.
- Local-link check on the README: 75 anchors, all target slugs retained,
  every `Needs` link resolves and points to an earlier section.
- `python3 research/blueprint/intake.py check-files` on the four deliverables:
  4 files, 0 problems. `git diff --check`: clean.

## For the next review and for follow-ups

- The packet `research/blueprint/packets/EulerSystemsCyclotomicMainConjecture.json`
  still lists the four gaps and the old requests (Coleman L4 m=1 comparison,
  Dirichlet L2 m=1 comparison, Dirichlet L3 nonvanishing, IntegralIwasawaTheory
  L2 odd-p lattices). A packet edit was outside this job's deliverables. A
  follow-up can delete those gaps and requests, add `sourceVersions` for
  Sinnott 1980 and Solomon 1990 with the hashes above, and add the new
  prerequisites: Hilbert 90, `IntegralIwasawaTheory:L4/baker-brumer-algebraic-numbers`
  and `PadicMeasuresIwasawaAlgebras:L4/iwasawa-growth-formula`.
- The reviewer should check §3.3 steps 5–7 (the local norm sequence and the
  ψ(p)=1 bookkeeping), §4.7 step 7 (the χ⁻¹-projection of the polar term)
  and the odd-p (G1)/(G2) normalisations in §4.21 against Solomon
  pp. 485–486.
- No ownership move: Sinnott's theorems are cited through the
  IntegralIwasawaTheory L0 contract, and Baker–Brumer through its L4 node.
