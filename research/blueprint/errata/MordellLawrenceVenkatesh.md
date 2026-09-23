# Mistakes in Lawrence–Venkatesh, *Diophantine problems and p-adic period mappings*

Job ERRATA-DESIGN-LV. Worker: Claude Code, session `cc-7b31c4`, 23 September 2026. The findings are in
`MordellLawrenceVenkatesh.json` beside this file: **20 findings — 11 misprints, 4 errors and 5 gaps; 8
reach nothing, 8 reach a proof and 4 reach a stated result.**

**Source and version.** Brian Lawrence and Akshay Venkatesh, *Diophantine problems and p-adic period
mappings*, arXiv:1807.02721v3 (25 October 2019), 76 pp.; published as *Invent. Math.* **221** (2020),
no. 3, 893–999, DOI [10.1007/s00222-020-00966-7](https://doi.org/10.1007/s00222-020-00966-7). Locators and
quotations below are to **arXiv v3**, as in the blueprint packet `MordellLawrenceVenkatesh.json`, whose
worker read §§1–8 line by line (and §9 to confirm the Mordell argument does not use it). The PDF read here
has sha256 `e3013516…`, matching the packet's record; the LaTeX source of the same version (e-print sha256
`6f697247…`) was read beside it, which is what makes the numbering of statements, equations and figures
verifiable.

**Where the findings come from.** The packet records no `sourceIssues`. Its worker put the corrections in
prose instead, in the section *Corrections and additions to the source* of
`research/blueprint/readmes/MordellLawrenceVenkatesh.md` and in the `match` fields of the nodes that carry
the affected statements. Those eleven bullets were read, separated into corrections and additions (see the
last section below), and each correction was re-checked at its locator in the source; that yields E2, E3,
E6, E7, E8, E9, E10, E12, E13, E14, E15, E16, E18 and E20. Six further mistakes — E1, E4, E5, E11, E17 and
E19 — were found while checking, and are recorded here for the first time.

**Existing corrections: none.** arXiv has exactly three versions of the paper and v3 is the last, so no
later preprint corrects anything. Crossref's record for the published version carries an empty `relation`
object with no `update-to` or `updated-by` entry, and the query `filter=updates:10.1007/s00222-020-00966-7`
returns no works; a Crossref search of *Inventiones* for a "Correction to: Diophantine problems and p-adic
period mappings" finds nothing. Venkatesh's publication page at the IAS lists the paper with no erratum.
Lawrence's pages could not be read (`people.math.wisc.edu/~blawrence/` returns HTTP 403; his Google Site
redirects to a sign-in). The published version itself could not be read: `link.springer.com` answers both
the article page and the `content/pdf` link with a client-challenge page. Every finding is therefore
recorded as `new`, and no claim is made here about whether Springer's copy differs at any locator.

## Effect on the main results

The paper's results are the finiteness of the `S`-unit equation (Theorem 4.1), Mordell's conjecture
(Theorem 5.4), the monodromy theorem for Kodaira–Parshin families (Theorem 8.1), and the
higher-dimensional Theorem 10.1. **No finding refutes any of them**, and the whole chain to Theorem 5.4
survives. Four findings reach a stated result:

- **E3 (error, Lemma 2.8).** The identity `η²|_{K_v^*} = χ · Norm^w` with `χ` of finite order is false on
  a uniformizer; it is true, and is only ever used, on the local units. Lemmas 2.9 and 2.10 and their uses
  in §4 and §6 are unaffected.
- **E7 (gap, Proposition 5.3).** Two hypotheses on `v` that the proof uses — odd residue characteristic,
  and no place of `S` above it — are missing from the statement, and are also not imposed when `v` is
  chosen in the proof of Theorem 5.4. Adding them costs nothing, since Chebotarev supplies infinitely many
  candidates.
- **E13 and E14 (errors, Lemmas 8.2 and 8.3).** Both are false for separating curves and need the
  hypothesis that the curve is nonseparating. Every application is to a nonseparating curve, so Theorem 8.1
  is unaffected.

The eight findings that reach a proof (E2, E6, E8, E9, E10, E12, E18, E20) are all repairable on the spot,
by the corrections recorded in the JSON; none of them needs a new idea. The remaining eight reach nothing.

## §1: the introduction

**E1 (misprint).** In *Structure of the paper* (p. 7) the higher-dimensional main result is called
"Proposition 10.1". It is set as a theorem, prints as **Theorem 10.1**, and is called Theorem 10.1 at its
three other citations (pp. 57, 60, 68). The same sentence is also loose about what is proved: Theorem 10.1
says that `Y(Z[S^{-1}])` is **not Zariski dense**, that is, lies in a *proper* Zariski-closed subset.

## §2: preparatory results

**E2 (misprint, reaches the proofs that cite Lemma 2.3).** Faltings's finiteness lemma is stated for
semisimple `ρ : G_K → GL_d(Q_p)` that are "unramified outside `S`", with `S` the set fixed on p. 8 — which,
by the same list of conventions, contains no place above `p`. But the lemma is applied three times to the
`p`-adic étale cohomology of a fibre (proof of Proposition 3.4, p. 20; proof of Lemma 4.2, p. 23; after
Lemma 6.1, p. 31), and such a representation is crystalline, hence in general ramified, at the places above
`p`. Each of those appeals is therefore outside the lemma's stated scope. The repair is to state the lemma
for an arbitrary finite set `T` of places — which is what Hermite–Minkowski, and Faltings's Satz 5 that the
proof cites, give — and to apply it with `T = S ∪ {w : w | p}`.

**E3 (error, reaches Lemma 2.8).** Lemma 2.8 concludes, for a friendly place `v` and a finitely ramified,
pure, locally algebraic `η : G_K → Q_p^*` of weight `w`, that `η²|_{K_v^*} = χ · Norm_{K_v/Q_p}^w` with `χ`
of finite order. Take `K = Q` (no CM subfield, so every finite place is friendly), `v = p`, and
`η = χ_cyc^{-1}`, which is pure of weight `w = 2`. As an idele class character `η(p) = 1`, because the
local Artin image of a uniformizer acts trivially on `μ_{p^∞}` in either normalisation; so `η²(p) = 1`
while `Norm(p)^w = p²`, and `χ(p) = p^{-2}` has infinite order. On units, by contrast, `η(u) = u` and
`η² = Norm²` exactly. The proof cannot give more than that: local algebraicity is agreement with an
algebraic character *in a neighbourhood of the identity*, and the closing step of the proof — that a
`Q_p`-rational character of `(Res_{E/Q} G_m)^1` pulls back trivially to `E_v^*` — is a statement about that
algebraic character, so it controls `η` on an open subgroup of `E_v^*` and says nothing about a
uniformizer. Lemmas 2.9 and 2.10 use only the restriction to units and the Hodge–Tate weight `w/2`, both of
which are correct; the packet states and proves the lemma on units for that reason.

**E4 (gap).** Lemma 2.12 — the algebraic Goursat lemma for subgroups of `Sp(V)^N` that project onto each
factor and contain an element with two unipotent projections of different fixed-space dimension — is
printed with no proof, only the two sentences "an algebraic version of Goursat's lemma (cf. [Ribet, Lemma
5.2.1])" and "One uses the fact that the Lie algebra `sp_V` is simple, and that all the automorphisms of
`sp_V` are inner". Ribet's lemma is Goursat for a product of two groups and says nothing about the
unipotent condition, which is exactly what excludes a graph of an isomorphism between two factors. The
lemma is true; the packet supplies the missing step at `LV.0/symplectic-pair-lemma`. It is used only
through Lemma 8.7.

## §3: fibres with good reduction

**E5 (misprint).** On p. 17, "This crystalline cohomology `V_v = H^q_dR(X_0/K)`" should read
`H^q_dR(X_0/K_v)`. Equation (3.4) defines `V = H^q_dR(X_0/K)` and `V_v = V ⊗_K K_v`, and the diagram (3.9)
just above has `V_v = H^q_dR(X_{y_0}/K_v)`; a `σ`-semilinear `φ_v` for the Frobenius of `K_v/Q_p` does not
act on the `K`-form at all.

**E6 (misprint, reaches the proof of Lemma 3.3).** Lemma 3.2 is stated with **one** radius `ε` serving both
the `v`-adic polydisk and the complex one. In the application, Lemma 3.3, the two radii are different and
must be: the `v`-adic disk has to be the whole residue disk `{|z_i|_v < 1} = (pO_v)^m`, since the
conclusion concerns `Φ_v(Ω_v)`, whereas the complex flat sections converge only on a small polydisk — §3.3
says so explicitly, "`v`-adically absolutely convergent for `|z_i|_v < |p|_v^{1/(p−1)}` … and `ι`-adically
absolutely convergent for sufficiently small `|z_i|_C`". Nothing in the proof of Lemma 3.2 compares the two
radii: it uses only that a convergent series vanishing on its polydisk is the zero series, and that a
`K_v`-solution of a `K`-linear system is a `K_v`-combination of `K`-solutions. Stating it with independent
radii `ε_v`, `ε_C` is the correction.

## §5: the outline of the Mordell argument

**E7 (gap, reaches Proposition 5.3).** The proposition asks only that the family have a good model over
`O_S` and that `v ∉ S` be friendly. Its proof, in §6, works throughout in the set-up of §3.1, which fixes a
place with three properties: `p > 2`, `K_v/Q_p` unramified, and no prime above `p` in `S`. Friendliness
(Definition 2.7) gives the second, since a friendly place is unramified over `Q`. It does not give the
other two, and both are used: `p > 2` is what puts the residue disk `(pO_v)^m` inside the region
`|z_i|_v < |p|_v^{1/(p−1)}` where the Gauss–Manin flat sections converge, and "no prime above `p` in `S`"
is what makes the fibres over `Y(K) = 𝒴(O)` have good reduction above `p`, so that `ρ_y` is crystalline at
`v` and the comparison (3.9) applies. The same omission recurs in the proof of Theorem 5.4, where `v` is
produced by Chebotarev subject only to friendliness and to two conditions on `q_v`; the two conditions of
§3.1 have to be imposed there as well, which is harmless because they exclude only `p = 2` and the finitely
many rational primes below `S`.

**E8 (misprint, reaches the proof of Theorem 5.4).** The count of small Frobenius orbits reads: "These
elements are contained in the union of the submodules `ker(T^i − 1)` for `1 ⩽ i ⩽ 8`". It should be
`1 ⩽ i ⩽ 7`. `size_v` counts elements in orbits of size **less than** 8, so `i ⩽ 7` suffices; and `i = 8`
is not available, because the next step — "for every odd prime factor `r` of `q − 1` we know that `q_v^i`
is not congruent to 1 modulo `r`" — is condition (iii) imposed on `v`, that the class of `q_v` in
`(Z/r)^*` has order **at least** 8. An order exactly 8 is allowed, and then `q_v^8 ≡ 1 mod r`, so
`q_v^8 − 1` need not be prime to `r` and the conclusion `2⟨m_1, m_2⟩ = 0` fails. The same off-by-one runs
through the following sentence and through "orbits of size 8 or smaller". Nothing numerical changes: the
bound `8 · 2^g (q − 1)^g` for seven submodules is the same bound, a fortiori.

## §6: rational points on the base

**E9 (error, reaches the proof of Lemma 6.1).** After the Sublemma the proof says "Fix any `(y'_0, w)`
above `(y_0, v)` with `[K(y'_0)_w : K_v] ⩾ 8`" and then reduces to the finiteness of the `y` whose period
lands in `H^bad` **for that one pair**. But the Sublemma produces, for each bad `y` separately, *some* pair
`(y', w)` above `(y, v)` of local degree at least 8, which under the identification (6.4) corresponds to
*some* pair above `(y_0, v)`; which one depends on `y`. A pair fixed in advance does not catch every bad
`y`. The correction is to take the union over all pairs above `(y_0, v)` of local degree at least 8 — a
finite set — so that the bad `y` lie in a finite union of finite sets. Lemma 6.1 and Proposition 5.3 stand.

**E10 (misprint, reaches the proof of Lemma 6.1).** Lemma 6.3 asserts a Zariski-open `A` of Lagrangians `F`
for which "there is no `φ`-invariant `L_w`-subspace `W` of `V` satisfying (6.12)", and the set `H^bad` in
the proof of Lemma 6.1 is defined by the existence of a Frobenius-stable `W` satisfying (6.12), which reads
`dim(F ∩ W) ⩾ ½ dim(W)`. Both `W = 0` and `W = V` satisfy (6.12) for *every* `F` — the first because
`0 ⩾ 0`, the second because `dim(F ∩ V) = dim F = ½ dim V` for a Lagrangian — and both are `φ`-stable. Read
literally, then, `H^bad` is everything and the only `A` available is empty, so the step "`H^bad` is
contained in a proper closed `K_v`-subvariety" fails. The two places must require `0 ≠ W ≠ V`, exactly as
the Sublemma does ("a nonzero proper Frobenius-stable subspace") and as Lemma 6.4 does ("there exists a
proper nonzero subspace `W ⊂ V`"). With that reading Lemma 6.3 is what its proof establishes and what the
Sublemma feeds it.

## §7: the Kodaira–Parshin family

**E11 (misprint).** In Proposition 7.1(ii) the induced homomorphism is written
`π_1^geom(Y − y', y_0) → Aut_G(Z_{(y',y_0)}) ≅ G`, but `y'` is a point of `Y'`, not of `Y`. The group meant
is `π_1^geom(Y − π(y'), y_0)`: the preceding sentence says the cover `Z_{y'} → Y` is ramified exactly at
`π(y')`, and part (i) attaches to `y'` a surjection out of `π_1^geom(Y − y, *)` with `y = π(y')`.

**E12 (misprint, reaches the proof of Lemma 7.4).** The proof says the homotopy sequence of the fibration
"is short exact because the `π_2` of `Y − {y_0}` vanishes". The fibration is the second map of (7.5),
`(Y² − Δ) → Y`, `(y, y') ↦ y'`, whose **fibre** is `Y − {y_0}`; its long exact sequence reads
`π_2(Y) → π_1(Y − {y_0}) → π_1(Y² − Δ) → π_1(Y) → π_0`, so injectivity on the left is governed by `π_2` of
the **base** `Y`. The conclusion holds — `Y` is a closed surface of genus at least 2, hence aspherical, so
`π_2(Y) = 0` — and in any case what the argument goes on to use is the normality of `Γ` in `Γ̃^geom`, which
is the middle exactness.

## §8: the monodromy of Kodaira–Parshin families

**E13 (error, reaches Lemma 8.2).** "Let `e` be a simple closed curve in `Y − {y}`. Then the classes of the
preimages `[e_1], …, [e_k]` … are linearly independent; projected to `H_1^Pr(Z, Y)`, their span has
dimension `k − 1`." The curve has to be **nonseparating**. If `e` separates `Y` and its monodromy is
trivial then `k = q` and `Σ_i [e_i] = π^*[e] = 0`, since `[e] = 0` in `H_1(Y; Q)`; in the extreme case where
`e` bounds a disk in `Y − {y}` every `e_i` bounds a disk in `Z`, all the classes vanish, and their span
projects to `0` rather than to a space of dimension `q − 1`. The paper's own definition of a simple closed
curve — the image of a smooth embedding of `S¹` — admits such curves. The printed proof needs the
hypothesis too: it begins "`Y` admits the structure of a CW complex with one 2-cell such that `e` belongs
to the 1-skeleton", and if `e` separates `Y` then the complement of a 1-complex containing `e` is
disconnected, so it is not one open 2-cell. Every application is to a liftable curve, whose monodromy
projects to a generator of `F_q^*` and whose class in `H_1(Y)` is therefore nonzero, so nothing downstream
changes.

**E14 (error, reaches Lemma 8.3).** The same hypothesis is missing from Lemma 8.3, which asserts that the
rank of `Mon(D_e^M) − Id` on `H_1^Pr(Z, Y)` determines the conjugacy class of `Cov(e)`. Without it the
statement is false: for `e` bounding a disk in `Y − {y}` the rank is `0` and `Cov(e) = 1`, while for a
nonseparating `e` whose monodromy is a `q`-cycle the rank is also `0`. For nonseparating `e` the rank is
`k − 1`, and the three cycle types available in `Aff(q)` — `(1^q)`, `(q)` and `(1, r, …, r)` — have
`k = q`, `1` and `1 + (q − 1)/r` cycles, all distinct, so the lemma holds.

**E15 (misprint).** Lemma 8.3 writes `MCG(Y)_Z` and Lemma 8.9 writes `MCG(Y)_{Z_i}`; both should be
`MCG(Y − {y})`. The covers of §8 are the singly ramified `Aff(q)`-covers of `(Y, y)`, classified by
homomorphisms out of `π_1(Y − {y})`, and it is the mapping class group of the punctured surface that
permutes them. §8.2 defines `MCG(Y − {y})_0` as the intersection of the `MCG(Y − {y})_{Z_i}` (p. 40); that
is the group carrying the monodromy map (8.3) and appearing in Lemma 8.7, to which Lemma 8.9 is the
reduction. §8.3 itself says of a curve in `Y − {y}` that "we can regard `D_e` as an element of
`MCG(Y − {y})`".

**E16 (gap).** Lemma 8.6 — that the image of `π_1(Y, y)_0` in each `Sp(H_1^Pr(Z_i, Y))` is not central —
is the step that promotes Lemma 8.7 to Theorem 8.1, and its proof reads in full: "We leave the simple
topological proof to the reader." The attached footnote sketches an algebro-geometric alternative (the
theorem of the fixed part, then Torelli, then de Franchis), but that too is a sketch, and it leaves the
topological line of §8. The lemma is true; the packet proves it at `LV.10/push-monodromy-noncentral` by
pushing a point along a nonseparating curve in the split part of the normal form and computing the
resulting unipotent on primitive homology.

**E17 (misprint).** That footnote says "If (a) were false". Lemma 8.6 is a single unlabelled assertion with
no parts, and nothing in §8 has a part (a); the clause is a leftover from an arrangement in which the
assertion was one item of a list, and is in any case redundant after "Suppose to the contrary".

**E18 (gap, reaches the proof of Lemma 8.8).** The last case of the proof needs a simple closed curve `η`
in `Y − y` mapping to `β_1β_2β_1^{-1}β_2^{q−c_1}`, and offers a figure for it. The exponent `q − c_1` runs
over `1, …, q − 1` as `c_1` runs over `F_q^*`, but the picture is drawn once and its caption computes the
word `β_1β_2β_1^{-1}β_2^{2}` — the case `q − c_1 = 2` alone. Existence for every exponent is true, and the
packet constructs the curve for each of them at `LV.10/covers-distinguished-by-curve`, but it does not
follow from the figure as drawn, and Lemma 8.8 is one of the two inputs to Lemma 8.7.

**E19 (misprint).** The two cross-references to figures in §8 print the wrong numbers: "see Figure 8.5 and
its caption" (p. 47) and "see Figure 8.6" (p. 50). The paper has five figures, numbered 1 to 5, and the
targets are **Figure 4** (p. 48, "The curve `η`") and **Figure 5** (p. 49, "The curves `γ_j` and `w` on
`Y`"). These are exactly the two figures whose `\label` stands before the `\caption` in the source, so the
reference picks up a theorem number instead of a figure number.

**E20 (gap, reaches the proof of Lemma 8.11).** "We can choose this basis in such a way that all powers
`β_1β_2^j` with `j` non-negative are represented by simple closed curves on `T°`, which start and end at
`p`" is asserted with neither proof nor reference, and Figure 5 draws only some of the curves. It carries
the rest of Lemma 8.11, since the `γ_{j*}` are defined to be these `β_1β_2^j` for `j ∈ [0, q]`, and Lemma
8.11 is what the proof of Lemma 8.10 — hence of Lemma 8.9, hence of Theorem 8.1 — rests on. It is true: on
a once-punctured torus `β_1β_2^j` is a primitive class, so it is represented by a simple closed curve, and
the representatives may be taken through `p`; concretely they are the images of `β_1` under the powers of
the Dehn twist about `β_2`.

## Not recorded as mistakes

Three of the eleven bullets in the packet's *Corrections and additions to the source* are additions rather
than corrections, and are deliberately left out of the JSON:

- **"LV Lemmas 6.3 and 6.4 need only `r ⩾ 5`."** The paper states both with `r ⩾ 8`, which is what §6 has
  available, and the proof of Lemma 6.4 itself says "In fact our argument will show that `r ⩾ 5` is
  enough". Stating the sharper bound is a strengthening, not a repair. (The other half of that bullet, the
  omission of `0 ≠ W ≠ V`, is E10.)
- **"The curves `β_1β_2^j` of LV Lemma 8.11 are realized as Dehn twists."** That is the packet's
  construction; the defect in the source is that no construction is given at all, which is E20.
- **"The monodromy of the Legendre family, used in LV Lemma 4.3, is derived from point pushing, and the
  nonconstancy of the period map in LV Lemma 4.4 from full monodromy."** The paper's own derivations — from
  local monodromy near `t = 0` and `t = 1`, and from the Torelli theorem — are correct; the packet simply
  takes a route that its own layers already own.

Two further bullets are recorded in a wider form than the packet gives them. Its "LV Lemma 8.9 concerns
`MCG(Y ∖ {y})_{Z_i}`" is E15, which also covers the identical abbreviation in Lemma 8.3; and its "LV Lemma
8.6 is proved in LV.10" is split into E16 (no proof is printed) and E17 (the footnote's dangling reference
to a part (a)).
